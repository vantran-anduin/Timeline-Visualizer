# Quick Start Guide - Get Running in 10 Minutes

## Current Status ✅
- ✅ Node.js installed (v22.19.0)
- ✅ Backend dependencies installed
- ✅ Frontend dependencies installed
- ✅ Environment file created

## Next Steps (Choose One Option)

---

## 🚀 OPTION 1: MongoDB Atlas (Cloud - RECOMMENDED)

**Fastest way to get started - no local installation needed!**

### Step 1: Create Free MongoDB Atlas Account (3 minutes)

1. Go to: https://www.mongodb.com/cloud/atlas/register
2. Sign up (free tier available)
3. Create a new cluster (choose free tier M0)
4. Wait for cluster to deploy (~2-3 minutes)

### Step 2: Get Connection String

1. In Atlas, click "Connect" on your cluster
2. Choose "Connect your application"
3. Copy the connection string (looks like):
   ```
   mongodb+srv://username:<password>@cluster0.xxxxx.mongodb.net/
   ```
4. Replace `<password>` with your database password

### Step 3: Configure .env

1. Open `backend/.env` file
2. Replace the MONGODB_URI line with your connection string:
   ```
   MONGODB_URI=mongodb+srv://username:yourpassword@cluster0.xxxxx.mongodb.net/clickup-timeline?retryWrites=true&w=majority
   ```

### Step 4: Get ClickUp OAuth Credentials (5 minutes)

1. Go to: https://app.clickup.com/settings/apps
2. Click "Create an App"
3. Fill in:
   - App Name: "Timeline Visualizer"
   - Redirect URL: `http://localhost:5000/auth/clickup/callback`
4. Click "Create App"
5. Copy your **Client ID** and **Client Secret**

### Step 5: Update .env with ClickUp Credentials

Open `backend/.env` and update:
```
CLICKUP_CLIENT_ID=your_actual_client_id
CLICKUP_CLIENT_SECRET=your_actual_client_secret
```

### Step 6: Start the Application

Open **TWO** terminal windows:

**Terminal 1 - Backend:**
```bash
cd "/Users/tranvan/Timeline Visualizer App/backend"
npm run dev
```

**Terminal 2 - Frontend:**
```bash
cd "/Users/tranvan/Timeline Visualizer App/frontend"
npm run dev
```

### Step 7: Access the App

Open browser: **http://localhost:3000**

---

## 🔧 OPTION 2: Install MongoDB Locally

### Step 1: Install MongoDB

**On macOS (using Homebrew):**
```bash
brew tap mongodb/brew
brew install mongodb-community
brew services start mongodb-community
```

**On Windows:**
1. Download from: https://www.mongodb.com/try/download/community
2. Run installer
3. Start MongoDB service from Services panel

**On Linux (Ubuntu/Debian):**
```bash
sudo apt-get install mongodb
sudo systemctl start mongodb
```

### Step 2: Verify MongoDB is Running

```bash
mongod --version
```

### Step 3: Update .env

Open `backend/.env` and make sure it has:
```
MONGODB_URI=mongodb://localhost:27017/clickup-timeline
```

### Step 4-7: Same as Option 1 Steps 4-7

---

## ⚡ Quick Test Without ClickUp (For Development)

If you just want to see the app interface without setting up ClickUp OAuth yet:

1. Comment out authentication in `backend/src/routes/task.routes.js` and `timeline.routes.js`
2. Or use mock data for testing

---

## 🎯 What You Need Before Running

1. **MongoDB Connection** (Atlas OR Local)
2. **ClickUp OAuth Credentials** (Client ID + Secret)

---

## 📝 Quick Commands Reference

```bash
# Install dependencies (already done ✅)
cd backend && npm install
cd frontend && npm install

# Start backend
cd backend
npm run dev

# Start frontend (in new terminal)
cd frontend
npm run dev

# Check if servers are running
# Backend: http://localhost:5000/health
# Frontend: http://localhost:3000
```

---

## 🐛 Troubleshooting

### "Cannot connect to MongoDB"
- **Atlas**: Check connection string, password, and network access (allow 0.0.0.0/0)
- **Local**: Ensure MongoDB is running (`brew services start mongodb-community`)

### "OAuth redirect mismatch"
- In ClickUp app settings, redirect URI must be exactly:
  `http://localhost:5000/auth/clickup/callback`

### "Port already in use"
```bash
# Kill process on port 5000
lsof -ti:5000 | xargs kill -9

# Kill process on port 3000
lsof -ti:3000 | xargs kill -9
```

### Frontend shows blank page
- Open browser console (F12) and check for errors
- Verify backend is running on port 5000
- Check CORS settings

---

## ✅ Verification Checklist

- [ ] MongoDB is accessible (Atlas or local)
- [ ] backend/.env has MongoDB URI
- [ ] backend/.env has ClickUp Client ID
- [ ] backend/.env has ClickUp Client Secret
- [ ] Backend running on http://localhost:5000
- [ ] Frontend running on http://localhost:3000
- [ ] Can access http://localhost:3000 in browser

---

## 🎉 Success!

When everything is working:
1. You'll see the login page at http://localhost:3000
2. Click "Login with ClickUp"
3. Authorize the app
4. You'll be redirected to the dashboard
5. Paste a ClickUp task URL and start visualizing!

---

## 💡 Need Help?

1. Check backend terminal for error messages
2. Check frontend terminal for errors
3. Open browser console (F12) for frontend errors
4. Review .env file configuration
5. Verify ClickUp OAuth app is enabled

---

**Recommended: Start with Option 1 (MongoDB Atlas) - it's the fastest way to get running!**
