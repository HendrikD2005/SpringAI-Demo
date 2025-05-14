import { Routes, Route, Navigate } from 'react-router-dom';
import ChatPage from './pages/ChatPage';
import HistoryPage from './pages/HistoryPage';
import MenuSidebar from './components/MenuSidebar';
import { Box } from '@mui/material';

function App() {
    return (
        <Box sx={{ display: 'flex' }}>
            <MenuSidebar>
                <Box component="main" sx={{ flexGrow: 1, p: 3 }}>
                    <Routes>
                        <Route path="/" element={<Navigate to="/chat" replace />} />
                        <Route path="/chat" element={<ChatPage />} />
                        <Route path="/history" element={<HistoryPage />} />
                    </Routes>
                </Box>
            </MenuSidebar>
        </Box>
    );
}

export default App;