# MongoDB Setup - Choose Your Method

## ✅ OPTION 1: MongoDB Atlas (RECOMMENDED - 5 minutes, No Installation)

### Step 1: Create Free Account
1. Go to: https://www.mongodb.com/cloud/atlas/register
2. Sign up with Google/GitHub or email
3. Choose "Free Shared" tier (M0)

### Step 2: Create Cluster
1. Click "Build a Database"
2. Choose "FREE" tier (M0 Sandbox)
3. Choose cloud provider: AWS
4. Choose region: Closest to you (e.g., us-east-1)
5. Cluster name: leave default or name it "clickup-timeline"
6. Click "Create"
7. Wait 1-3 minutes for deployment

### Step 3: Create Database User
1. Click "Database Access" in left sidebar
2. Click "Add New Database User"
3. Authentication: Username and Password
4. Username: `clickupuser`
5. Password: Generate a secure password (SAVE THIS!)
6. Database User Privileges: "Read and write to any database"
7. Click "Add User"

### Step 4: Allow Network Access
1. Click "Network Access" in left sidebar
2. Click "Add IP Address"
3. Click "Allow Access from Anywhere" (for development)
4. Confirm

### Step 5: Get Connection String
1. Go back to "Database" in left sidebar
2. Click "Connect" button on your cluster
3. Choose "Connect your application"
4. Driver: Node.js
5. Copy the connection string (looks like):
   ```
   mongodb+srv://clickupuser:<password>@cluster0.xxxxx.mongodb.net/?retryWrites=true&w=majority
   ```

### Step 6: Update .env File
1. Replace `<password>` in the string with your actual password
2. Open: `/Users/tranvan/Timeline Visualizer App/backend/.env`
3. Replace this line:
   ```
   MONGODB_URI=mongodb+srv://<username>:<password>@cluster0.xxxxx.mongodb.net/clickup-timeline?retryWrites=true&w=majority
   ```

   With your actual connection string:
   ```
   MONGODB_URI=mongodb+srv://clickupuser:YOUR_PASSWORD@cluster0.xxxxx.mongodb.net/clickup-timeline?retryWrites=true&w=majority
   ```

### ✅ Done! Skip to "Start the App" section below

---

## OPTION 2: Install MongoDB Locally (Manual - 15 minutes)

### Step 1: Install Homebrew (if not installed)
Open Terminal and run:
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
Follow the prompts and enter your Mac password when asked.

### Step 2: Install MongoDB
```bash
brew tap mongodb/brew
brew install mongodb-community
```

### Step 3: Start MongoDB
```bash
brew services start mongodb-community
```

### Step 4: Verify MongoDB is Running
```bash
brew services list | grep mongodb
```
Should show "started"

### Step 5: Update .env File
1. Open: `/Users/tranvan/Timeline Visualizer App/backend/.env`
2. Find the line with:
   ```
   # MONGODB_URI=mongodb://localhost:27017/clickup-timeline
   ```
3. Remove the `#` to uncomment it:
   ```
   MONGODB_URI=mongodb://localhost:27017/clickup-timeline
   ```
4. Comment out the Atlas line by adding `#`:
   ```
   # MONGODB_URI=mongodb+srv://...
   ```

### ✅ Done! Proceed to "Start the App"

---

## 🚀 Start the App

Once MongoDB is set up (Option 1 OR Option 2):

### Terminal 1 - Start Backend
```bash
cd "/Users/tranvan/Timeline Visualizer App/backend"
npm run dev
```

You should see:
```
MongoDB Connected: ...
Server running on port 5001
```

### Terminal 2 - Start Frontend
```bash
cd "/Users/tranvan/Timeline Visualizer App/frontend"
npm run dev
```

You should see:
```
VITE ready in XXX ms
Local: http://localhost:3000/
```

### Open Browser
Go to: **http://localhost:3000**

---

## 🐛 Troubleshooting

### Atlas: "Authentication failed"
- Check password has no special characters that need escaping
- Try resetting database user password

### Atlas: "Network timeout"
- Ensure Network Access allows your IP (or 0.0.0.0/0)
- Check internet connection

### Local: "MongoDB not running"
```bash
brew services restart mongodb-community
```

### Backend won't start
- Check .env file has correct MONGODB_URI
- Check MongoDB is accessible
- Look for errors in terminal

---

## ✅ Success Indicators

When everything works:
- ✅ Backend shows "MongoDB Connected"
- ✅ Backend shows "Server running on port 5001"
- ✅ Frontend shows "Local: http://localhost:3000"
- ✅ Browser shows login page at http://localhost:3000

---

**RECOMMENDATION: Use MongoDB Atlas (Option 1) - it's free, faster, and easier!**
