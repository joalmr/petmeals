# comfypet

Nueva version de Comfypet dev

## firebase

- en build gradle proyecto agregar dentro de dependencies:
  - classpath 'com.google.gms:google-services:4.3.15'
- en build gradle app agregar:
  - en los plugins:
  - id 'com.google.gms.google-services'
  - en las dependencies:
    - implementation platform('com.google.firebase:firebase-bom:32.2.3')
