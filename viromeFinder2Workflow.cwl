cwlVersion: v1.2
class: Workflow

requirements:
  InlineJavascriptRequirement: {}
  ScatterFeatureRequirement: {}

inputs:
  db_path:
    type: Directory
  fasta_file:
    type: File
  threads:
    type: int?

outputs:
  viromeFolder:
    type: Directory
    outputSource: viromeFinder2/viromeFolder

steps:
  viromeFinder2:
    run: cwl/virSorter2SL.cwl
    in:
      db_path: db_path
      fasta_file: fasta_file
      threads: threads
    out: [viromeFolder]
