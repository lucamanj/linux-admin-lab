# Linux Admin Lab

Laboratorio pratico di amministrazione di sistemi Linux, progettato per dimostrare le competenze coperte dalla certificazione *LPIC-1*.

## Progetti Inclusi

### 1. Toolkit di Diagnostica di Sistema (sysdiag.sh)
Uno script Bash automatizzato situato in bin/sysdiag.sh per monitorare lo stato di salute del sistema in tempo reale.

#### Funzionalità principali:
- *Uso Disco*: Analisi delle partizioni di sistema tramite df.
- *Memoria RAM*: Monitoraggio dell'uso della memoria e dello spazio Swap tramite free.
- *Processi Top CPU/RAM*: Individuazione dei processi più energivori tramite ps.
- *Configurazione Modulare*: Parametri di soglia personalizzabili gestiti in config/sysdiag.conf.

#### Requisiti:
- Bash Shell (v4.0+)
- Utility core Linux: df, free, ps

#### Come eseguire lo script:
```bash
# Dai i permessi di esecuzione (se non già presenti)
chmod +x bin/sysdiag.sh

# Esegui lo script
./bin/sysdiag.sh
