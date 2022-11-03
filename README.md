# MATA76-banco-de-dados
<br />
<br />

## Aplicação I: Agendamento

... TODO



----
<br />
<br />

## Aplicação II: Livraria
### Como rodar:
```
docker-compose -f docker-compose-livraria.yml up
```

### Tabelas:
- books
  - id: text PK NOT_NULL
  - name: text NOT_NULL
  - author_id: text FK NULL
  - pages: int NOT_NULL
- users
  - id: text PK NOT_NULL
  - name: text NOT_NULL
  - cpf: text NOT_NULL
- users_borrows_books
  - book_id: text FK NOT_NULL
  - user_id: text FK NOT_NULL
- authors
  - id: text PK NOT_NULL
  - name: text NOT_NULL
- books_from_authors
  - book_id: text FK NOT_NULL
  - author_id: text FK NOT_NULL
----

