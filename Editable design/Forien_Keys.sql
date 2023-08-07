     ALTER TABLE employee
 ADD CONSTRAINT emp_bran  FOREIGN KEY (com_id) REFERENCES branch(branch_id)
   ON DELETE CASCADE  ON UPDATE CASCADE;
   
    ALTER TABLE bill_in
 ADD CONSTRAINT in_bill_emp  FOREIGN KEY (emp_id) REFERENCES employee(person_id)
   ON DELETE CASCADE  ON UPDATE CASCADE,
 ADD CONSTRAINT in_bill_sup   FOREIGN KEY (bill_sup_id) REFERENCES supplier(person_id)
   ON DELETE CASCADE  ON UPDATE CASCADE;
   
       ALTER TABLE bill_body_in
 ADD CONSTRAINT in_bodytohead  FOREIGN KEY (bill_in_id) REFERENCES bill_in(bill_id)
   ON DELETE CASCADE  ON UPDATE CASCADE,
 ADD CONSTRAINT in_prod_bill   FOREIGN KEY (prod_id) REFERENCES product(prod_id)
   ON DELETE CASCADE  ON UPDATE CASCADE;
   
       ALTER TABLE bill_out
 ADD CONSTRAINT out_bill_emp  FOREIGN KEY (emp_id) REFERENCES employee(person_id)
   ON DELETE CASCADE  ON UPDATE CASCADE,
 ADD CONSTRAINT out_bill_cus   FOREIGN KEY (bill_cus_id) REFERENCES customer(person_id)
   ON DELETE CASCADE  ON UPDATE CASCADE;
   
       ALTER TABLE bill_body_out
 ADD CONSTRAINT out_bodytohead  FOREIGN KEY (bill_out_id) REFERENCES bill_out(bill_id)
   ON DELETE CASCADE  ON UPDATE CASCADE,
 ADD CONSTRAINT out_prod_bill   FOREIGN KEY (prod_id) REFERENCES product(prod_id)
   ON DELETE CASCADE  ON UPDATE CASCADE;
   
		ALTER TABLE login
 ADD CONSTRAINT log_emp   FOREIGN KEY (emp_id) REFERENCES employee(person_id)
   ON DELETE CASCADE  ON UPDATE CASCADE;

       ALTER TABLE emp_has
 ADD CONSTRAINT has_emp  FOREIGN KEY (emp_id) REFERENCES employee(person_id)
   ON DELETE CASCADE  ON UPDATE CASCADE,
 ADD CONSTRAINT has_role   FOREIGN KEY (role_id) REFERENCES role(role_id)
   ON DELETE CASCADE  ON UPDATE CASCADE,
 ADD CONSTRAINT has_per   FOREIGN KEY (per_role_id) REFERENCES permissions(per_role_id)
   ON DELETE CASCADE  ON UPDATE CASCADE;
   
          ALTER TABLE product
 ADD CONSTRAINT prod_ctg   FOREIGN KEY (ctg_id) REFERENCES category(ctg_id)
   ON DELETE CASCADE  ON UPDATE CASCADE,
 ADD CONSTRAINT prod_subCtg   FOREIGN KEY (subctg_id) REFERENCES sub_category(subctg_id)
   ON DELETE CASCADE  ON UPDATE CASCADE;
   
   		ALTER TABLE supplies
 ADD CONSTRAINT supp  FOREIGN KEY (person_id) REFERENCES employee(person_id)
   ON DELETE CASCADE  ON UPDATE CASCADE,
 ADD CONSTRAINT sup_prod   FOREIGN KEY (prod_id) REFERENCES product(prod_id)
   ON DELETE CASCADE  ON UPDATE CASCADE;

	  ALTER TABLE stock
 ADD CONSTRAINT stock_id   FOREIGN KEY (prod_id) REFERENCES product(prod_id)
   ON DELETE CASCADE  ON UPDATE CASCADE;

   
   