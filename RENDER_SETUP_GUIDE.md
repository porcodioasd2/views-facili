# 🚀 GUIDA DEPLOY SU RENDER

## ✅ STEP 1: Accedi a Render
1. Vai su https://render.com
2. Clicca **"Sign Up"** o **"Sign In"** con GitHub
3. Autorizza Render ad accedere ai tuoi repository

## ✅ STEP 2: Crea un nuovo Web Service
1. Dal dashboard Render, clicca **"New +"**
2. Seleziona **"Web Service"**
3. Scegli **"Deploy from Git Repository"**

## ✅ STEP 3: Connetti il Repository
1. Se GitHub non è già collegato, clicca **"Connect GitHub"**
2. Cerca e seleziona: **`porcodioasd2/views-facili`**

## ✅ STEP 4: Configura il Servizio

```
Name:                youtube-shorts-viewer
Region:              Frankfurt (EU) oppure Oregon (USA)
Branch:              main
Runtime:             Docker (auto-rilevato dal Dockerfile)
Build Command:       (lascia vuoto - usa Dockerfile)
Start Command:       (lascia vuoto - usa Dockerfile)
Auto-deploy:         ON (✓)
Plan:                Free
```

## ✅ STEP 5: Aggiungi Variabili di Ambiente

Nel tab **"Environment"** aggiungi:

```
PORT                = 3000
NODE_ENV            = production
YOUTUBE_API_KEY     = <inserisci una chiave API YouTube>
```

**Come ottenere YOUTUBE_API_KEY:**
1. Vai su https://console.cloud.google.com
2. Crea un nuovo progetto
3. Abilita YouTube Data API v3
4. Crea API Key (Credenziali → API Key)
5. Copia la chiave

## ✅ STEP 6: Deploy

Clicca **"Create Web Service"**
Render inizierà il build e il deploy (5-10 minuti)

Al termine, vedrai l'URL: `https://youtube-shorts-viewer-XXXX.onrender.com`

## ⚙️ Per gli amici che vogliono usare lo stesso account YouTube:
Puoi aggiungere più chiavi API:

```
YOUTUBE_API_KEY_2 = <seconda chiave>
YOUTUBE_API_KEY_3 = <terza chiave>
```

Il server le userà automaticamente per il load balancing!

## ⏸️ Note sul Piano Gratuito Render:

✅ **Gratis**: 750 ore/mese (un servizio continuo = ~31 giorni)
⏸️ **Limitazione**: Dopo 15 minuti di inattività, il servizio va in sleep
🔄 **Riattivazione**: Il primo accesso dopo sleep richiede 30-60 secondi di warm-up
💾 **Storage**: 0.5 GB incluso

## 🆘 Se fallisce il build:

1. Vai su Render → Il tuo servizio → **"Logs"**
2. Cerca errori come:
   - `npm ERR! 404` → Dipendenze mancanti
   - `Python not found` → Dockerfile non trovato
   - `Port already in use` → Cambia PORT

3. Se necessario, fai un rebuild: 
   - Dashboard → **"Manual Deploy"** → **"Latest Commit"**

## 📊 Monitoraggio

Dopo il deploy, puoi monitorare:
- **URL**: https://youtube-shorts-viewer-XXXX.onrender.com
- **Logs**: Dashboard → Logs in tempo reale
- **Metrics**: CPU, memoria, richieste
