SELECT 
    g.title AS [Group_Title],
    gt.start_date
FROM group_teacher AS gt
JOIN groups AS g ON gt.group_id = g.id
JOIN group_teacher_status AS gts ON gt.status_id = gts.id
WHERE gt.teacher_id = 12 
  AND gts.slug = 'active';
