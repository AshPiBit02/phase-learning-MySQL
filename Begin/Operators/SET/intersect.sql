# INTERSECT 
-- returns only the common rows between two SELECT statements.
-- it gives the intersect of two result sets.

-- Find destinations that appear in both Local and International tables.
 SELECT destination FROM local_tourism INTERSECT
  SELECT destination FROM international_tourism;
  -- Find(destination, category) pairs that appear in both tables.
  SELECT destination,category FROM local_tourism INTERSECT 
  SELECT destination,category FROM international_tourism;
  -- Find destination with more than 10,000 visitors that appear in both tables.
  SELECT destination,visitors from local_tourism WHERE visitors>10000 INTERSECT
  SELECT destination,visitors FROM international_tourism WHERE visitors>10000;
  -- Count how many destination overlap betweeen local and international.
  SELECT COUNT(*) AS overlap_count FROM (SELECT destination FROM 
  local_tourism INTERSECT SELECT destination FROM international_tourism ) AS combined_tourism;
  -- Find categories that overlap between local and international tourism.
  SELECT category FROM local_tourism INTERSECT 
  SELECT category FROM international_tourism ;
  -- Find destinations that overlap and also belong to the category 'Heritage'.
   SELECT category FROM local_tourism WHERE category IN ('Heritage') INTERSECT 
  SELECT category FROM international_tourism WHERE category IN ('Heritage') ;

