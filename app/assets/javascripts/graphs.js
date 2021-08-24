document.addEventListener('turbolinks:load', () => {
  if (document.getElementById('start-calendar')) {
    // '2020-01-12'のような文字列から，Javascriptの日付オブジェクトを取得する関数
    // setHoursを使用しないと，時差の影響で0時にならないため注意！
    const convertDate = (date) => new Date(new Date(date).setHours(0, 0, 0, 0))

    // 日付の古い方・新しい方を取得する関数
    const minDate = (date1, date2) => (date1 < date2) ? date1 : date2
    const maxDate = (date1, date2) => (date1 > date2) ? date1 : date2

    // データの初日・最終日
    const START_DATE = convertDate(gon.cigarette_records[0].date)
    const END_DATE = convertDate(gon.cigarette_records[gon.cigarette_records.length - 1].date)

    // カレンダーの日本語化
    flatpickr.localize(flatpickr.l10ns.ja)

    const drawGraphForPeriod = () => {
      let from = convertDate(document.getElementById('start-calendar').value)
      let to = convertDate(document.getElementById('end-calendar').value)

      if (from > to) {
        alert('終了日は開始日以降の日付に設定して下さい')
      } else {
        drawGraph(from, to)
      }
    }

    const periodCalendarOption = {
      // スマートフォンでもカレンダーに「flatpickr」を使用
      disableMobile: true,
      // 選択できる期間を設定
      minDate: START_DATE,
      maxDate: END_DATE,
      // 日付選択後のイベント
      onChange: drawGraphForPeriod
    }

    // カレンダー
    const startCalendarFlatpickr = flatpickr('#start-calendar', periodCalendarOption)
    const endCalendarFlatpickr = flatpickr('#end-calendar', periodCalendarOption)

    // 新規登録用のカレンダー
    flatpickr('#new-calendar', {
      disableMobile: true,
      // 記録のある日付を選択できないようにする
      disable: gon.recorded_dates,
      defaultDate: 'today',
    })

    // 編集モーダルで日付を選択したときに，記録された喫煙本数を表示する関数
    const editCalendar = document.getElementById('edit-calendar')
    const editCigarette = document.getElementById('edit-cigarette')
    const inputCigarette = () => {
      let record = gon.cigarette_records.find((record) => record.date === editCalendar.value)
      editCigarette.value = record.cigarette
    }

    // 記録編集用のカレンダー
    flatpickr('#edit-calendar', {
      disableMobile: true,
      // 記録のある日付のみ選択できるようにする
      enable: gon.recorded_dates,
      // 記録が無い場合は日付を選択できないようにする
      noCalendar: gon.recorded_dates.length === 0,
      onChange: inputCigarette



    })

    const TODAY = convertDate(new Date())
    const A_MONTH_AGO = new Date(TODAY.getFullYear(), TODAY.getMonth() - 1, TODAY.getDate() + 1)

    // グラフを描く場所を取得
    const chartCigaretteContext = document.getElementById("chart-cigarette").getContext('2d')

    // グラフ（ drawGraph 関数の外で変数宣言をしなければならない!）
    let chartCigarette

    // 期間を指定してグラフを描く
    const drawGraph = (from, to) => {
      // from から to までの期間のデータに絞る
      let records = gon.cigarette_records.filter((record) => {
        let date = convertDate(record.date)
        return from <= date && date <= to
      })

      // 日付のみのデータを作成
      let dates = records.map((record) => {
        // 横軸のラベル表示は簡潔にしたいので，
        // 日付 2020-01-08 を 1/8 のような形式に変換する
        return record.date.replace(/^\d+-0*(\d+)-0*(\d+)$/, '$1/$2')
      })

      // タバコのみのデータを作成
      let cigarettes = records.map((record) => record.cigarette)

      let cigaretteData = {
        labels: dates,
        datasets: [{
          label: 'タバコ(本)',
          data: cigarettes,
          backgroundColor: 'rgba(255, 99, 132, 0.2)',
          borderColor: 'rgba(255, 99, 132, 1)',
          borderWidth: 1,
          spanGaps: true
        }]
      }

      let cigaretteOption = {
        tooltips: {
          callbacks: {
            // ホバー（スマホならタップ）時のラベル表示を変更
            title: function (tooltipItems) {
              return tooltipItems[0].xLabel.replace(/^(\d+).(\d+)$/, ' $1 月 $2 日')
            },
            label: function (tooltipItem) {
              return 'タバコ: ' + tooltipItem.yLabel + '本'
            }
          }
        }
      }

      if (!chartCigarette) {
        // グラフが存在しないときは，作成する
        chartCigarette = new Chart(chartCigaretteContext, {
          type: 'bar',
          data: cigaretteData,
          options: cigaretteOption
        })
      } else {
        // グラフが存在するときは，更新する
        chartCigarette.data = cigaretteData
        chartCigarette.options = cigaretteOption
        chartCigarette.update()
      }
    }

    // 引数の日付から今日までのグラフを描く関数
    const drawGraphToToday = (from) => {
      // データが存在する範囲に修正
      from = maxDate(from, START_DATE)
      let to = minDate(TODAY, END_DATE)
      drawGraph(from, to)
      // フォームの開始日・終了日を変更する
      startCalendarFlatpickr.setDate(from)
      endCalendarFlatpickr.setDate(to)
    }


    // 過去◯週間のグラフを描くボタン
    // document.getElementById('a-week-button').addEventListener('click', () => {
    //   drawGraphToToday(A_WEEK_AGO)
    // })

    // document.getElementById('two-weeks-button').addEventListener('click', () => {
    //   drawGraphToToday(TWO_WEEKS_AGO)
    // })

    // document.getElementById('a-month-button').addEventListener('click', () => {
    //   drawGraphToToday(A_MONTH_AGO)
    // })

    // document.getElementById('three-months-button').addEventListener('click', () => {
    //   drawGraphToToday(THREE_MONTHS_AGO)
    // })

    // グラフの初期表示
    drawGraphToToday(A_MONTH_AGO)
  }
})