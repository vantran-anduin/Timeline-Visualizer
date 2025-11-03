# ClickUp Timeline Visualizer App

Transform your ClickUp tasks into interactive, editable timelines with drag-and-drop functionality and seamless synchronization.

## Features

- **OAuth2 Authentication**: Secure login with ClickUp
- **Task Extraction**: Fetch tasks and subtasks directly from ClickUp
- **Interactive Timeline**: Visualize tasks with half-day precision
- **Drag & Drop**: Reschedule tasks by dragging timeline bars
- **Resize Bars**: Adjust task duration by resizing from edges
- **Local Save**: Save timeline modifications locally
- **ClickUp Sync**: Push changes back to ClickUp instantly
- **Automatic Calculations**: Auto-update dates and effort hours

## Tech Stack

### Backend
- **Node.js** with Express
- **MongoDB** with Mongoose
- **Passport.js** for OAuth2
- **ClickUp API** integration
- JWT session management

### Frontend
- **React 18** with Hooks
- **Vite** for fast development
- **TailwindCSS** for styling
- **D3.js** for timeline visualization
- **React Router** for navigation
- **Axios** for API calls

## Project Structure

```
Timeline Visualizer App/
├── backend/
│   ├── src/
│   │   ├── config/         # Database and Passport config
│   │   ├── controllers/    # Route handlers
│   │   ├── middleware/     # Auth middleware
│   │   ├── models/         # Mongoose schemas
│   │   ├── routes/         # API routes
│   │   ├── services/       # ClickUp API service
│   │   └── server.js       # Express server
│   ├── package.json
│   └── .env.example
├── frontend/
│   ├── src/
│   │   ├── components/     # React components
│   │   ├── services/       # API services
│   │   ├── utils/          # Helper functions
│   │   └── styles/         # CSS files
│   ├── package.json
│   └── vite.config.js
└── README.md
```

## Getting Started

### Prerequisites

- Node.js 18+ and npm
- MongoDB (local or cloud)
- ClickUp account with API access

### 1. ClickUp API Setup

1. Go to [ClickUp API Settings](https://app.clickup.com/settings/apps)
2. Create a new OAuth2 app
3. Set redirect URI: `http://localhost:5000/auth/clickup/callback`
4. Note your Client ID and Client Secret

### 2. Backend Setup

```bash
cd backend

# Install dependencies
npm install

# Create .env file
cp .env.example .env

# Edit .env with your credentials:
# - CLICKUP_CLIENT_ID
# - CLICKUP_CLIENT_SECRET
# - MONGODB_URI
# - SESSION_SECRET

# Start MongoDB (if running locally)
mongod

# Start backend server
npm run dev
```

Backend runs on `http://localhost:5000`

### 3. Frontend Setup

```bash
cd frontend

# Install dependencies
npm install

# Start development server
npm run dev
```

Frontend runs on `http://localhost:3000`

### 4. Access the App

1. Open `http://localhost:3000`
2. Click "Login with ClickUp"
3. Authorize the app
4. Start visualizing timelines!

## Usage Guide

### 1. Import a Task

1. Copy a ClickUp task URL (format: `https://app.clickup.com/t/abc123`)
2. Paste it into the task input field
3. Click "Fetch Tasks"

### 2. View Timeline

- Each subtask appears as a colored bar
- Bar width = task duration
- Timeline uses half-day increments:
  - **Morning**: 9 AM - 2 PM (5 hours)
  - **Afternoon**: 2 PM - 11 PM (9 hours)

### 3. Edit Timeline

**Drag to Reschedule:**
- Click and drag any bar to change its start date
- Dates snap to half-day boundaries

**Resize to Adjust Duration:**
- Drag left edge to change start date
- Drag right edge to change due date
- Effort hours auto-calculate

### 4. Save Changes

**Save Locally:**
- Saves timeline to database
- Changes NOT synced to ClickUp yet

**Apply to ClickUp:**
- Syncs all changes to ClickUp
- Updates start dates, due dates, and effort

## API Endpoints

### Authentication
- `GET /auth/clickup` - Initiate OAuth
- `GET /auth/clickup/callback` - OAuth callback
- `GET /auth/status` - Check auth status
- `GET /auth/user` - Get current user
- `POST /auth/logout` - Logout

### Tasks
- `POST /api/tasks/fetch` - Fetch tasks from ClickUp
- `PUT /api/tasks/:taskId` - Update single task
- `POST /api/tasks/batch-update` - Update multiple tasks

### Timelines
- `POST /api/timelines` - Save timeline
- `GET /api/timelines` - Get all timelines
- `GET /api/timelines/:taskId` - Get specific timeline
- `DELETE /api/timelines/:taskId` - Delete timeline
- `POST /api/timelines/:taskId/sync` - Mark as synced

## Environment Variables

### Backend (.env)

```env
PORT=5000
NODE_ENV=development

# ClickUp OAuth2
CLICKUP_CLIENT_ID=your_client_id
CLICKUP_CLIENT_SECRET=your_client_secret
CLICKUP_REDIRECT_URI=http://localhost:5000/auth/clickup/callback

# Database
MONGODB_URI=mongodb://localhost:27017/clickup-timeline

# Security
SESSION_SECRET=your_random_secret_key

# Frontend
FRONTEND_URL=http://localhost:3000
```

### Frontend (.env.local)

```env
VITE_API_URL=http://localhost:5000
```

## Development

### Backend Development

```bash
cd backend
npm run dev  # Uses nodemon for auto-reload
```

### Frontend Development

```bash
cd frontend
npm run dev  # Vite hot reload
```

### Run Tests

```bash
# Backend
cd backend
npm test

# Frontend
cd frontend
npm test
```

## Production Deployment

### Backend

```bash
cd backend
npm install --production
npm start
```

### Frontend

```bash
cd frontend
npm run build
npm run preview
```

## Troubleshooting

### OAuth Fails
- Verify ClickUp Client ID and Secret
- Check redirect URI matches exactly
- Ensure ClickUp app is enabled

### Tasks Not Loading
- Check ClickUp API token is valid
- Verify task URL format
- Check task has subtasks

### Timeline Not Rendering
- Ensure subtasks have dates
- Check browser console for errors
- Verify D3.js is loaded

### Sync Fails
- Check ClickUp API rate limits
- Verify user has task edit permissions
- Check network connection

## Future Enhancements

- [ ] Slack/Email notifications
- [ ] Task dependency visualization
- [ ] Gantt chart PDF export
- [ ] Multi-user collaboration
- [ ] Custom time slot configuration
- [ ] Undo/Redo functionality
- [ ] Keyboard shortcuts
- [ ] Mobile responsive design

## Contributing

1. Fork the repository
2. Create feature branch (`git checkout -b feature/amazing-feature`)
3. Commit changes (`git commit -m 'Add amazing feature'`)
4. Push to branch (`git push origin feature/amazing-feature`)
5. Open Pull Request

## License

This project is licensed under the MIT License.

## Support

For issues or questions:
- Open an issue on GitHub
- Check ClickUp API documentation
- Review error logs in browser console

## Acknowledgments

- ClickUp API for task management integration
- D3.js for powerful data visualization
- React community for excellent tooling
