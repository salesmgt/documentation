INSERT INTO school
    (school_name, school_addrerss, district, school_phone, school_type, school_scale, educational_level, school_status, school_description, is_active,
    representative_name, representative_phone, representative_email, representative_gender)
VALUES
    ('Ngô Duy Tự', 'Hiếu Nghĩa, Tân Lập 1', 'Gò Vấp', '0938654789', '', 'Lớn','Tiểu học','Đang hoạt động','Trường rất có tiềm năng',true,
    'Trương Thái Thất','0935879654','baolam@gmail.com.vn',true);
INSERT INTO school
    (school_name, school_addrerss, district, school_phone, school_type, school_scale, educational_level, school_status, school_description, is_active,
    representative_name, representative_phone, representative_email, representative_gender)
VALUES
    ('Lý Tự Trọng', 'Hiếu Nghĩa, Tân Lập 1', '12', '0938654789', '', 'Lớn','Trung học cơ sở','Đang hoạt động','Trường rất có tiềm năng',true,
    'Nguyễn Thiện Tài','0935879654','baolam@gmail.com.vn',true);
INSERT INTO school
    (school_name, school_addrerss, district, school_phone, school_type, school_scale, educational_level, school_status, school_description, is_active,
    representative_name, representative_phone, representative_email, representative_gender)
VALUES
    ('Ngô Quyền', '134 Phước Long A ', 'Thủ Đức', '0938654789', '', 'Lớn','Tiểu học','Đang hoạt động','Trường rất có tiềm năng',true,
    'Hạ Quyền','0935879654','baolam@gmail.com.vn',false);
    
INSERT INTO salesmgt.user
    (username, password_hash, full_name, user_phone, user_email, is_active, user_gender, birth_date, user_address)
VALUES
('nguyenthiennhan','YW55IGNhcm5hbCBwbGVhc3VyZS4=','Nguyễn Thiện Nhân', '0935846789','nhan@gmail.com.vn', true, true,'1980-06-17', 'Hồ Chí Minh');

INSERT INTO salesmgt.user
    (username, password_hash, full_name, user_phone, user_email, is_active, user_gender, birth_date, user_address)
VALUES
('daoduytien','YW55IGNhcm5hbCBwbGVhc3VyZS4=','Phạm Duy Tiến', '0935846789','tien@gmail.com.vn', true, true,'1980-06-17', 'Hồ Chí Minh');


INSERT INTO target_school
    (school_id, purpose, target_school_status,school_year, username, start_time)
VALUES
(5,'Sale mới','In progress','2020-2021','daoduytien','2020-07-23');
INSERT INTO target_school
    (school_id, purpose, target_school_status,school_year, username, start_time)
VALUES
(6,'Sale mới','In progress','2020-2021','daoduytien','2020-07-23');
INSERT INTO target_school
    (school_id, purpose, target_school_status,school_year, username, start_time)
VALUES
(7,'Sale mới','Fail','2020-2021','nguyenthiennhan','2020-07-23');
INSERT INTO report
    (target_school_id, report_date,result, report_description)
VALUES
(8,'2020-12-29','Gặp được hiệu trưởng','bàn công chuyện hợp đồng sắp kí kết với thầy');

select * from school where is_active= true;
select * from user where is_active= true;
select * from target_school; 
-- select list report of a target (target --> report) 
select * from report INNER JOIN target_school on report.target_school_id = target_school.target_school_id;
-- select list report of a school (school --> target --> report)
select r.report_id, r.report_date, r.report_description, tar.purpose, tar.school_year, s.school_name, s.representative_name  
from report r, target_school tar, school s 
where (r.target_school_id = tar.target_school_id and tar.school_id=s.school_id and s.school_id = 1);
-- select list of report of a salesman (salesman --> target --> report)
select r.report_id, r.report_date, r.report_description, tar.purpose, tar.school_year, s.full_name  
from report r, target_school tar, salesmgt.user s 
where (r.target_school_id = tar.target_school_id and tar.username = s.username and s.username = 'daoduytien');