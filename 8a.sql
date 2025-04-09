Queries using date functions (Sysdate, next_day, add_months, last_day, months_between,    least, greatest, trunc, round, to_char, to_date).
--sys date
SELECT SYSDATE AS current_date FROM dual;
--Next day
SELECT NEXT_DAY(SYSDATE, 'MONDAY') AS next_monday FROM dual;
--add months
SELECT ADD_MONTHS(SYSDATE, 3) AS date_after_3_months FROM dual;
--last day
SELECT LAST_DAY(SYSDATE) AS end_of_month FROM dual;
--months difference
SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('01-JAN-2025', 'DD-MON-YYYY')) AS months_diff
FROM dual;
--least and greatest
SELECT LEAST(SYSDATE, TO_DATE('31-DEC-2025', 'DD-MM-YYYY')) AS earliest,
       GREATEST(SYSDATE, TO_DATE('01-JAN-2025', 'DD-MM-YYYY')) AS latest
FROM dual;
--truncate
SELECT TRUNC(SYSDATE) AS today_no_time,
       TRUNC(SYSDATE, 'MM') AS first_day_of_month,
       TRUNC(SYSDATE, 'YYYY') AS first_day_of_year
FROM dual;
--ruund date
SELECT ROUND(SYSDATE, 'MM') AS rounded_month,
       ROUND(SYSDATE, 'YYYY') AS rounded_year
FROM dual;
--To char
SELECT TO_CHAR(SYSDATE, 'DD-Mon-YYYY HH:MI:SS AM') AS formatted
FROM dual;
--To date string
SELECT TO_DATE('15-03-2025', 'DD-MM-YYYY') AS real_date
FROM dual;
