# prakt
Сайт практики та працевлаштування для студентів РТФ
@RA-41m

База даних:
https://docs.google.com/document/d/1ntwtvh_ESygR-cZ4_QFK7A-EqGt-8HMArmRBnscw-no/edit?usp=sharing

Приклад запиту до БД:
select
    c.fullname,
	s.name,
	s.code,
	r.count,
	r.year,
	d.reg_num,
	d.reg_date
from
    request r
        join company c
            on r.company_id=c.id
        join speciality s
            on r.speciality_id=s.id
		join documents d
			on r.document_id=d.id
