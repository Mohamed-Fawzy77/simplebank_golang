-- name: CreateAccount :one
INSERT INTO accounts (
  owner, balance, currency
) VALUES (
  $1, $2, $3
)
RETURNING *;

-- name: GetAccount :one
SELECT * FROM accounts
where id = $1 LIMIT 1;

-- name: ListAccounts :many
SELECT * FROm accounts
ORDER BY id
LIMIT $1
OFFSET $2;

-- name: UpdateAccountBalance :one
UPDATE accounts
  set balance = $2
WHERE id = $1
RETURNING *;

-- name: DeleteAccount :exec
DELETE FROM accounts
where id = $1;
