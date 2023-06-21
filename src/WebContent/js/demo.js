//登録データをカレンダーに反映させるJavaScript

//【注意】Date内の日付は登録したい月の前の月を入力する。例：6/10は5/10と入力。
var events = [
  {'Date': new Date(2023, 5, 2), 'Title': '&#127867;', 'Link': 'data.html'},
  {'Date': new Date(2023, 5, 10), 'Title': '&#127867;', 'Link': 'data.html'},
  {'Date': new Date(2023, 5, 11), 'Title': '&#127867;', 'Link': 'data.html'},
  {'Date': new Date(2023, 5, 13), 'Title': '&#127867;', 'Link': 'data.html'},
];

var settings = {};
var element = document.getElementById('calendar');
calendar(element, events, settings);