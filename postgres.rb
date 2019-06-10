# Query to send 
query = "SELECT 
id AS talent_advocate_id,
talent_advocate_name,
nb_offers,
rank() over (ORDER BY nb_offers DESC) AS rank
FROM talent_advocates
JOIN (SELECT 
COALESCE(talent_advocate_id, talent_advocates.id) AS talent_advocate_id, 
COALESCE( nb_offers, 0) AS nb_offers,
name AS talent_advocate_name
FROM
talent_advocates
LEFT JOIN (SELECT 
talent_advocate_id,
nb_offers
FROM 
candidates
JOIN (SELECT 
candidate_id,
COUNT (candidate_id) as nb_offers
FROM 
job_offers
GROUP BY
candidate_id)
AS offers ON offers.candidate_id = candidates.id)
AS c ON c.talent_advocate_id = talent_advocates.id)
AS d ON d.talent_advocate_id = talent_advocates.id
"