

@transform_pandas(
    Output(rid="ri.vector.main.execute.adfead7f-5801-4c46-b48e-d377c82f12ce"),
    concept_set_members=Input(rid="ri.foundry.main.dataset.e670c5ad-42ca-46a2-ae55-e917e3e161b6")
)
--#@ name: input_concept_set_members
--#@ description: N3C table of community-defined OMOP concept sets
--#@ saved: no
--#@
--#@
--#@
--#@
SELECT *
FROM concept_set_members

@transform_pandas(
    Output(rid="ri.vector.main.execute.db839486-9cda-4e2b-90f5-c0711f0dbe55"),
    input_concept_set_members=Input(rid="ri.vector.main.execute.adfead7f-5801-4c46-b48e-d377c82f12ce")
)
SELECT concept_id 
FROM input_concept_set_members
WHERE codeset_id = 980588199 and is_most_recent_version = true

