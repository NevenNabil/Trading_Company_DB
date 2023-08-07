INSERT INTO branch (name,street ,postalcode ,city)
VALUES ('Alex Branch', '638','El-Marg', 'October'),
('Giza Branch', '152','El-Saf', 'Giza'),
('Cairo Branch', '731', 'Ain Shams', 'Cairo');

INSERT INTO employee (FName, Minit,LName ,phone ,street ,postalcode ,city ,gender ,email ,day ,month ,year, com_id, salary )
VALUES  ('Niveen','K','Adel', '01258965458','40','Sarayat','Cairo','F','neven40@gmail.com','20','3','1992','1','4000'),
('Islam','T','Magdi', '01525469523','36','Khalifa','Zagazig','M','islaam@gmail.com','11','5','1979','3','3500'),
('Alaa','S','Mohammed', '01025436598','12','El-Tahrir','Giza','F','Alaa399@gmail.com','14','7','1991','1','4500'),
('Ibrahim','K','Mohsen', '01232532697','20','Fire El-Nasser','Cairo','M','Ibrahim38@gmail.com','3','1','1996','2','6000'),
('Ali','A','Fikry', '01025125463','14','Ain Shams','Cairo','M','AliFikry200@gmail.com','12','2','1986','3','7500');

INSERT INTO  login ( emp_id,username ,password)
VALUES ('1', 'Niveen123','gkj256h21'),
('2', 'Islam345','ert25vh'),
('3', 'Alaa125','dffr56hbb21'),
('4', 'Ibrahim654','wer12f52'),
('5', 'Ali1267','drt12g5');

INSERT INTO supplier (FName, Minit,LName ,phone ,street ,postalcode ,city ,gender ,email ,day ,month ,year, title )
VALUES  ('Soaad','K','Adel', '01258965458','40','Sarayat','Cairo','F','Soaad40@gmail.com','20','3','1992','chemicals'),
('Omar','T','Magdi', '01525469523','36','Khalifa','Zagazig','M','Omar@gmail.com','11','5','1979','fashion'),
('Mary','S','Mohammed', '01025436598','12','El-Tahrir','Giza','F','Mary399@gmail.com','14','7','1990','chemicals'),
('Fathy','K','Mohsen', '01232532697','20','Fire El-Nasser','Cairo','M','Fathy38@gmail.com','3','1','1996','furniture'),
('Ali','A','Fikry', '01025125463','14','Ain Shams','Cairo','M','AliFikry200@gmail.com','12','2','1986','fashion');

INSERT INTO customer (FName, Minit,LName ,phone ,street ,postalcode ,city ,gender ,email ,day ,month ,year, potential )
VALUES  ('Hanaa','K','Adel', '01258965458','40','Sarayat','Cairo','F','Hanaa40@gmail.com','20','3','1992','A'),
('Magdy','T','Magdi', '01525469523','36','Khalifa','Zagazig','M','Magdy@gmail.com','11','5','1979','B'),
('Mariam','S','Mohammed', '01025436598','12','El-Tahrir','Giza','F','Mariam399@gmail.com','14','7','1990','B'),
('Mina','K','Mohsen', '01232532697','20','Fire El-Nasser','Cairo','M','Mina38@gmail.com','3','1','1996','C'),
('nabil','A','Fikry', '01025125463','14','Ain Shams','Cairo','M','nabil200@gmail.com','12','2','1986','A');

INSERT INTO role (role_name, role_descibtion)
VALUES ('manager', 'contrl,lead'),
('employee', 'make bills'),
('worker', 'transporting goods');

INSERT INTO permissions (per_name)
VALUES ('burchasing'),
('selling'),
('make reports'),
('add product'),
('add employee'),
('add supplier'),
('add customer'),
('update price');

INSERT INTO emp_has ( emp_id, role_id,per_role_id)
VALUES ('2', '1','4'),
('2', '1','5'),
('2', '1','6'),
('2', '1','7'),
('1', '2','8'),
('5', '2','1'),
('5', '2','2'),
('3', '2','2'),
('1', '2','2'),
('4', '2','2'),
('4', '2','3');

INSERT INTO category (ctg_name)
VALUES ('body care'),
('fashion');

INSERT INTO sub_category (subctg_name)
VALUES ('nails'),
('cosmetics'),
('makeup'),
('dress'),
('t-shirt'),
('jeans');

INSERT INTO product (prod_name,code , ctg_id,subctg_id)
VALUES ('nail remover', 'N001','1', '1'),
('blusher', 'g201','1', '3'),
('shower', 'r569','1', '2'),
('bodyLoshn', 'u589','1', '2'),
('maskara', 'g256', '1', '3'),
('highWaste', 'yt569','2', '6'),
('shortDress', 'f256','2', '4'),
('nightDress', 'q236', '2', '4');

INSERT INTO stock ( prod_id,quantity ,price)
VALUES ('1', '100','70'),
('2', '150','150'),
('3', '141','130'),
('4', '351','140'),
('5', '120','250'),
('6', '213','400'),
('7', '250','450'),
('8', '400','750');

INSERT INTO bill_in (bill_date , emp_id,bill_sup_id)
VALUES ('2021-09-05', '1','3'),
('2021-12-03', '1','4'),
('2021-06-03', '3','2'),
('2022-10-02', '4','5'),
('2022-2-13', '5','1');

INSERT INTO bill_body_in (bill_in_id,prod_id ,quantity ,price ,discount )
VALUES ('1', '3','26', '130','5'),
('1', '5','13', '120','5'),
('2', '4','5', '140','0'),
('3', '7','22', '450','10'),
('3', '8', '14', '750','0'),
('4', '2','2', '150','8'),
('5', '1','13', '70','0'),
('5', '6', '20', '400','6');

INSERT INTO bill_out (bill_date , emp_id,bill_cus_id)
VALUES ('2021-09-05', '1','3'),
('2021-12-03', '1','4'),
('2021-06-03', '3','2'),
('2022-10-02', '4','5'),
('2022-2-13', '5','1');

INSERT INTO bill_body_out (bill_out_id,prod_id ,quantity ,price ,discount )
VALUES ('1', '3','12', '130','5'),
('1', '5','13', '35','5'),
('2', '4','5', '33','0'),
('3', '7','22', '122','10'),
('3', '8', '14', '16','0'),
('4', '2','2', '54','8'),
('5', '1','13', '33','0'),
('5', '6', '20', '22','6');


INSERT INTO supplies (person_id, prod_id)
VALUES ('1', '5'),
('2', '8'),
('5', '7'),
('3', '4'),
('4', '3'),
('5', '6'),
('3', '1'),
('1', '2'),
('2', '6');






