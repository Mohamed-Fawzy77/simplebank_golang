-- name: CreateEntry :one
INSERT INTO entries(
    account_id, amount
    ) VALUES (
        $1, $2
) 
RETURNING *;

-- name: GetEntry :one
SELECT * FROM entries
where id = $1;

-- name: ListeEtries :many
SELECT * FROM entries
ORDER BY id
LIMIT $1
OFFSET $2;

