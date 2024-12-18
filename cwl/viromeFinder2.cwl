cwlVersion: v1.2
class: CommandLineTool

hints:
  DockerRequirement:
    dockerPull: original/virsorter2
  ResourceRequirement:
    coresMin: 1
    coresMax: $(inputs.threads)
    
requirements:
  InlineJavascriptRequirement: {}
  InitialWorkDirRequirement:    
    listing:
      - entry: $(inputs.fasta_file)
        writable: True
      - entry: $(inputs.db_path)
        writable: True



baseCommand: ["virsorter","run"]

arguments: 
  - valueFrom: "all"
  - valueFrom: "test_resFolder"
    prefix: "-w"

inputs:
  fasta_file:
    type: File
    inputBinding:
      position: 1
      prefix: "-i"

  threads:
    type: int?
    default: 1
    inputBinding:
      position: 2
      prefix: "-j"

  db_path:
    type: Directory
    inputBinding:
      position: 3
      prefix: "--db-dir="
      separate: false

outputs:
  viromeFolder:
    type: Directory
    outputBinding:
      glob: "*_resFolder"
