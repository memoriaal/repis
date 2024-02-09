select pnk.updated, pnk.* from pub.nimekirjad pnk
where updated in
(
select updated
from pub.nimekirjad nk
group by nk.updated
having count(1) < 30
order by count(1) desc
)
order by updated
;
