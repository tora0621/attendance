Worker.create!([
  {first_name: "高山", last_name: "三郎", first_name_kana: "タカヤマ", last_name_kana: "サブロウ", tel: "09012345678", e_mail: "sample3@gmail.com", post_number: "1234567", address: "東京都町田市成", birthday: "", classification: "パートタイマー", authority: "一般スタッフ", hire_date: "", departure_date: "", affiliation: nil, status: "un_attendance", per_hour: 1000},
  {first_name: "鈴木", last_name: "四郎", first_name_kana: "スズキ", last_name_kana: "シロウ", tel: "09012345678", e_mail: "sample4@gmail.com", post_number: "1234567", address: "東京都町田市成", birthday: "", classification: "パートタイマー", authority: "一般スタッフ", hire_date: "", departure_date: "", affiliation: nil, status: "un_attendance", per_hour: 1000},
  {first_name: "田中", last_name: "五郎", first_name_kana: "タナカ", last_name_kana: "ゴロウ", tel: "09012345678", e_mail: "sample5@gmail.com", post_number: "1234567", address: "東京都町田市成", birthday: "", classification: "パートタイマー", authority: "一般スタッフ", hire_date: "", departure_date: "", affiliation: nil, status: "un_attendance", per_hour: 1000}
])
Shift.create!([
  {start_at: "2019-10-31 09:58:46", end_at: "2019-11-01 15:30:00", rest_start_at: nil, rest_end_at: nil, worker_id: 1},
  {start_at: "2019-10-31 10:00:00", end_at: "2019-11-01 15:00:00", rest_start_at: nil, rest_end_at: nil, worker_id: 1},
  {start_at: "2019-10-31 10:00:00", end_at: "2019-11-01 15:48:49", rest_start_at: nil, rest_end_at: nil, worker_id: 2},
  {start_at: "2019-11-01 02:49:08", end_at: "2019-11-01 05:51:03", rest_start_at: nil, rest_end_at: nil, worker_id: 2},
  {start_at: "2019-11-01 08:01:11", end_at: "2019-11-01 12:24:05", rest_start_at: "2019-11-01 08:23:29", rest_end_at: "2019-11-01 08:23:48", worker_id: 2},
  {start_at: "2019-11-01 08:28:07", end_at: "2019-11-01 09:42:05", rest_start_at: nil, rest_end_at: nil, worker_id: 3},
  {start_at: "2019-11-01 09:56:13", end_at: "2019-11-01 09:56:35", rest_start_at: nil, rest_end_at: nil, worker_id: 3},
  {start_at: "2019-11-02 05:40:31", end_at: "2019-11-02 07:40:40", rest_start_at: nil, rest_end_at: nil, worker_id: 3},
  {start_at: "2019-11-02 10:15:39", end_at: "2019-11-02 16:15:39", rest_start_at: nil, rest_end_at: nil, worker_id: 3},
  {start_at: "2019-11-05 09:58:46", end_at: "2019-11-05 22:30:00", rest_start_at: "2019-11-05 15:00:00", rest_end_at: "2019-11-05 16:00:00", worker_id: 3},
  {start_at: "2019-11-05 09:58:46", end_at: "2019-11-05 22:30:00", rest_start_at: "2019-11-05 15:00:00", rest_end_at: "2019-11-05 16:00:00", worker_id: 1},
  {start_at: "2019-11-05 09:58:46", end_at: "2019-11-05 22:30:00", rest_start_at: "2019-11-05 15:00:00", rest_end_at: "2019-11-05 16:00:00", worker_id: 2}
])
Wage.create!([
  {worker_id: 1, base: 5000, long: 0, night: 0, total: 0, meals: 0, other: 0, shift_id: 1},
  {worker_id: 1, base: 5000, long: 0, night: 0, total: 0, meals: 0, other: 0, shift_id: 2},
  {worker_id: 2, base: 8000, long: 0, night: 0, total: 0, meals: 0, other: 0, shift_id: 3},
  {worker_id: 2, base: 8000, long: 0, night: 0, total: 0, meals: 0, other: 0, shift_id: 4},
  {worker_id: 2, base: 2003, long: 0, night: 0, total: 2003, meals: 0, other: 0, shift_id: 5},
  {worker_id: 3, base: 8000, long: 2500, night: 0, total: 10500, meals: 0, other: 0, shift_id: 6},
  {worker_id: 3, base: 8000, long: 3750, night: 0, total: 11750, meals: 0, other: 0, shift_id: 7},
  {worker_id: 3, base: 12000, long: 0, night: 0, total: 59, meals: 0, other: 0, shift_id: 8},
  {worker_id: 3, base: 9, long: 0, night: 0, total: 9, meals: 0, other: 0, shift_id: 9},
  {worker_id: 3, base: 5000, long: 0, night: 0, total: 9, meals: 0, other: 0, shift_id: 10},
  {worker_id: 1, base: 6000, long: 0, night: 0, total: 9, meals: 0, other: 0, shift_id: 11},
  {worker_id: 2, base: 4000, long: 0, night: 0, total: 9, meals: 0, other: 0, shift_id: 12}
])


