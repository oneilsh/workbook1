

@transform_pandas(
    Output(rid="ri.vector.main.execute.adfead7f-5801-4c46-b48e-d377c82f12ce"),
    concept_set_members=Input(rid="ri.foundry.main.dataset.e670c5ad-42ca-46a2-ae55-e917e3e161b6")
)
--* input_concept_set_members:
--*   ext: sql
--*   desc: "Just returns the concept_set_members input"
--*   inputs:
--*     - concept_set_members
SELECT *
FROM concept_set_members

@transform_pandas(
    Output(rid="ri.vector.main.execute.db839486-9cda-4e2b-90f5-c0711f0dbe55"),
    input_concept_set_members=Input(rid="ri.vector.main.execute.adfead7f-5801-4c46-b48e-d377c82f12ce")
)
--* pneumonia_concept_set:
--*   ext: sql
--*   desc: "Extract concepts childred on pneumonia (codeset ID 980588199)"
--*   inputs:
--*     - input_concept_set_members
SELECT concept_id 
FROM input_concept_set_members
WHERE codeset_id = 980588199 and is_most_recent_version = true
-- hehe

@transform_pandas(
    Output(rid="ri.foundry.main.dataset.130ca484-5580-48a9-9480-686c6ea1824a"),
    condition_era=Input(rid="ri.foundry.main.dataset.a00c67ed-f30b-4deb-9f6f-a7febafd3f8f"),
    pneumonia_concept_set=Input(rid="ri.vector.main.execute.db839486-9cda-4e2b-90f5-c0711f0dbe55")
)
--* pneumonia_conditions:
--*   ext: sql
--*   desc: "Extracts matching pneumonia conditions from the condition_era input."
--*   inputs:
--*     - pneumonia_concept_set
--*     - condition_era
SELECT *
FROM condition_era
INNER JOIN pneumonia_concept_set ON pneumonia_concept_set.concept_id = condition_era.condition_concept_id
-- now on example-branch

