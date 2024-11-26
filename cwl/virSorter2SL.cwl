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



baseCommand: ["bash","/virSorter2SL.sh"]

inputs:
  fasta_file:
    type: File
    inputBinding:
      position: 1
  db_path:
    type: Directory
    inputBinding:
      position: 2
  threads:
    type: int?
    default: 1
    inputBinding:
      position: 3

outputs:
  viromeFolder:
    type: Directory
    outputBinding:
      glob: "*_resFolder"


