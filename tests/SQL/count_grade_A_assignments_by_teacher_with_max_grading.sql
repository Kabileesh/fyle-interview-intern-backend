-- Write query to find the number of grade A's given by the teacher who has graded the most assignments
WITH teacher_assignment_count AS (
    SELECT teacher_id, COUNT(*) as num_assignments
    FROM assignments
    WHERE state = 'GRADED'
    GROUP BY teacher_id
)
SELECT COUNT(*)
FROM assignments
WHERE grade = 'A'
  AND teacher_id = (
      SELECT teacher_id
      FROM teacher_assignment_count
      ORDER BY num_assignments DESC
      LIMIT 1
  );
