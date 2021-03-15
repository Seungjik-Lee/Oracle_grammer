declare
    l_year number(5);
    s_year number(5);
BEGIN  
    l_year:=2002;
    select max(year)into s_year from lotto;
  while s_year >= (l_year)
  Loop  
  update lotto set year = l_year
  where
    (l_year =2002 and seq <= 
    (select max(seq) from lotto where year=l_year))    
    or(    seq <= 
    (select max(seq) from lotto where year=l_year)  
    and seq > (
    select max(seq) from lotto where year=(l_year-1)));
    
  l_year:=l_year+1;  
  end loop;
END;