# GALLANT CORNER

A working local starter for a Tanzanian fashion e-commerce brand.

## Tech stack
- Frontend: React + Vite
- Backend: Node.js + Express
- Demo storefront and checkout flow included
- MySQL-ready schema included, with automatic fallback to the local JSON catalog until a real database is configured

## Run locally

Use PowerShell with script execution bypassed so npm commands can run in this Windows environment:

### 1) Install frontend dependencies

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -Command "Set-Location 'c:\Users\agrey kamugisha\OneDrive\Desktop\gallant corner\client'; npm install --no-audit --no-fund"
```

### 2) Install backend dependencies

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -Command "Set-Location 'c:\Users\agrey kamugisha\OneDrive\Desktop\gallant corner\server'; npm install --no-audit --no-fund"
```

### 3) Start the backend

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -Command "Set-Location 'c:\Users\agrey kamugisha\OneDrive\Desktop\gallant corner\server'; npm run dev"
```

### 4) Start the frontend

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -Command "Set-Location 'c:\Users\agrey kamugisha\OneDrive\Desktop\gallant corner\client'; npm run dev -- --host 0.0.0.0"
```

### 5) Open the app

Visit:
- Frontend: http://localhost:5173/
- Backend health: http://localhost:4000/api/health

## Environment file
Create a local `.env` file in the project root based on the example values in `.env.example` before enabling real admin or database features.

If MySQL is running locally and the environment variables are set, the server will use it automatically. If not, the app stays fully usable through the bundled JSON catalog fallback.

## Production deployment notes

The app is now deployment-friendly for hosted environments:

- The frontend reads the API base from `VITE_API_URL` and falls back to the current origin in production.
- The backend serves the built Vite frontend from `client/dist` when `NODE_ENV=production`.
- Root scripts expose a production start path with `npm start` after `npm run build`.
- The server listens on `0.0.0.0`, which makes the app reachable from a phone on the same Wi‑Fi or hotspot network.
- The project includes a `render.yaml` configuration for a permanent public deployment on Render.

Example production start flow:

```bash
npm install
npm run build
NODE_ENV=production PORT=4000 HOST=0.0.0.0 npm start
```

Render deployment:

1. Push the repo to GitHub.
2. In Render, choose "New +" → "Web Service".
3. Connect the repo.
4. Render will use the included `render.yaml` file.
5. Confirm the generated environment variables and deploy.

For phone access on the same local network, find your computer's local IP address and open a URL like:

```text
http://192.168.1.25:4000
```

Set `VITE_API_URL` to your deployed backend URL when the frontend and API are hosted separately.

## Notes
- This is a local-ready starter with storefront browsing, cart flow, checkout, and admin demo screens.
- Real payment integration remains as a secure, provider-approved step for production deployment.
- The app is ready for local use and continues to support a real MySQL upgrade path without breaking the current demo experience.
