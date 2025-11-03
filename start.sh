#!/bin/bash

# ClickUp Timeline Visualizer - Development Startup Script

echo "🚀 Starting ClickUp Timeline Visualizer..."
echo ""

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js 18+ first."
    exit 1
fi

# Check if MongoDB is running
if ! pgrep -x "mongod" > /dev/null; then
    echo "⚠️  MongoDB is not running."
    echo "Starting MongoDB..."
    mongod --fork --logpath /tmp/mongodb.log
    if [ $? -eq 0 ]; then
        echo "✅ MongoDB started successfully"
    else
        echo "❌ Failed to start MongoDB. Please start it manually: mongod"
        exit 1
    fi
else
    echo "✅ MongoDB is already running"
fi

echo ""

# Check if dependencies are installed
if [ ! -d "backend/node_modules" ]; then
    echo "📦 Installing backend dependencies..."
    cd backend && npm install && cd ..
fi

if [ ! -d "frontend/node_modules" ]; then
    echo "📦 Installing frontend dependencies..."
    cd frontend && npm install && cd ..
fi

echo ""

# Check if .env exists
if [ ! -f "backend/.env" ]; then
    echo "⚠️  backend/.env not found!"
    echo "Creating .env from .env.example..."
    cp backend/.env.example backend/.env
    echo ""
    echo "⚠️  IMPORTANT: Edit backend/.env with your ClickUp credentials before continuing!"
    echo "Press Enter to open .env file, or Ctrl+C to exit and edit manually..."
    read
    ${EDITOR:-nano} backend/.env
fi

echo ""
echo "✅ All checks passed!"
echo ""
echo "Starting servers..."
echo "📍 Backend will run on: http://localhost:5000"
echo "📍 Frontend will run on: http://localhost:3000"
echo ""
echo "Press Ctrl+C to stop all servers"
echo ""

# Start both servers using concurrently if available
if command -v concurrently &> /dev/null; then
    concurrently -n "backend,frontend" -c "blue,green" \
        "cd backend && npm run dev" \
        "cd frontend && npm run dev"
else
    # Fallback: run in background
    echo "💡 Tip: Install concurrently for better logging: npm install -g concurrently"
    echo ""

    # Start backend
    cd backend
    npm run dev &
    BACKEND_PID=$!
    cd ..

    # Wait a bit for backend to start
    sleep 3

    # Start frontend
    cd frontend
    npm run dev &
    FRONTEND_PID=$!
    cd ..

    # Wait for both processes
    wait $BACKEND_PID $FRONTEND_PID
fi
