# Quick Setup Guide - ClickUp Timeline Visualizer

## Step-by-Step Setup (15 minutes)

### Step 1: Install Dependencies (5 min)

Make sure you have installed:
- [Node.js 18+](https://nodejs.org/)
- [MongoDB](https://www.mongodb.com/try/download/community) or [MongoDB Atlas](https://www.mongodb.com/cloud/atlas)

### Step 2: ClickUp OAuth Setup (5 min)

1. **Login to ClickUp**
   - Go to https://app.clickup.com

2. **Create OAuth App**
   - Navigate to Settings → Apps
   - Click "Create an App"
   - Fill in:
     - App Name: "Timeline Visualizer"
     - Redirect URL: `http://localhost:5000/auth/clickup/callback`

3. **Get Credentials**
   - Copy Client ID
   - Copy Client Secret
   - Keep these safe!

### Step 3: Backend Configuration (3 min)

```bash
# Navigate to backend folder
cd "Timeline Visualizer App/backend"

# Install packages
npm install

# Create environment file
cp .env.example .env

# Edit .env file with your editor
nano .env  # or use your preferred editor
```

**Update .env with:**
```env
CLICKUP_CLIENT_ID=<paste your client id>
CLICKUP_CLIENT_SECRET=<paste your client secret>
MONGODB_URI=mongodb://localhost:27017/clickup-timeline
SESSION_SECRET=<generate random string>
```

**Generate session secret:**
```bash
# On Mac/Linux
openssl rand -base64 32

# On Windows (PowerShell)
[Convert]::ToBase64String((1..32 | ForEach-Object { Get-Random -Minimum 0 -Maximum 256 }))
```

### Step 4: Frontend Configuration (2 min)

```bash
# Navigate to frontend folder
cd "../frontend"

# Install packages
npm install
```

### Step 5: Start the App

**Terminal 1 - Start MongoDB** (if running locally):
```bash
mongod
```

**Terminal 2 - Start Backend**:
```bash
cd backend
npm run dev
```

**Terminal 3 - Start Frontend**:
```bash
cd frontend
npm run dev
```

### Step 6: Test the App

1. Open browser: `http://localhost:3000`
2. Click "Login with ClickUp"
3. Authorize the app
4. You should be redirected to the dashboard!

## Verification Checklist

- [ ] Backend running on http://localhost:5000
- [ ] Frontend running on http://localhost:3000
- [ ] MongoDB connected (check backend logs)
- [ ] Can click "Login with ClickUp"
- [ ] Successfully authorized and redirected
- [ ] Dashboard loads without errors

## Common Issues & Fixes

### Issue: "Cannot connect to MongoDB"
**Fix:**
- Ensure MongoDB is running: `mongod`
- Check MONGODB_URI in .env
- Try: `mongodb://127.0.0.1:27017/clickup-timeline`

### Issue: "OAuth redirect mismatch"
**Fix:**
- In ClickUp app settings, ensure redirect URI is exactly:
  `http://localhost:5000/auth/clickup/callback`
- No trailing slash!

### Issue: "Port already in use"
**Fix:**
```bash
# Kill process on port 5000
lsof -ti:5000 | xargs kill -9

# Kill process on port 3000
lsof -ti:3000 | xargs kill -9
```

### Issue: "Module not found"
**Fix:**
```bash
# Delete and reinstall
rm -rf node_modules package-lock.json
npm install
```

## Testing the Full Flow

1. **Get a ClickUp Task URL:**
   - Go to ClickUp
   - Open any task that has subtasks
   - Click "..." menu → "Copy Link"

2. **Import the Task:**
   - Paste URL in the input field
   - Click "Fetch Tasks"

3. **Edit Timeline:**
   - Drag a bar to reschedule
   - Resize a bar to adjust duration

4. **Save:**
   - Click "Save Locally" to save to database
   - Click "Apply to ClickUp" to sync changes

## Next Steps

- Read the full [README.md](./README.md)
- Explore the codebase
- Customize the time slots
- Add your own features!

## Need Help?

- Check browser console for errors (F12)
- Check backend logs in terminal
- Review ClickUp API status
- Verify all environment variables are set

## Production Deployment Notes

When deploying to production:

1. Update redirect URI in ClickUp app
2. Set NODE_ENV=production
3. Use secure session secret
4. Enable HTTPS
5. Use production MongoDB (MongoDB Atlas)
6. Update FRONTEND_URL and CORS settings

## Quick Commands Reference

```bash
# Backend
cd backend
npm install          # Install dependencies
npm run dev         # Development mode
npm start           # Production mode

# Frontend
cd frontend
npm install         # Install dependencies
npm run dev         # Development mode
npm run build       # Build for production
npm run preview     # Preview production build

# Database
mongod              # Start MongoDB
mongo               # MongoDB shell
```

Enjoy building timelines! 🎉
