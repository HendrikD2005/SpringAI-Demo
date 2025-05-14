import React, { useState } from 'react';
import { TextField, Button, Box, Paper, Typography } from '@mui/material';
import axios from 'axios';
import { API_BASE_URL } from '../config';


export const QuestionField: React.FC = () => {
    const [question, setQuestion] = useState('');
    const [answer, setAnswer] = useState('');
    const [loading, setLoading] = useState(false);

    const handleSubmit = async () => {
        try {
            setLoading(true);
            const response = await axios.get(`${API_BASE_URL}/chat/${encodeURIComponent(question)}`, {
                headers: {
                    'Content-Type': 'application/json',
                }
            });
            setAnswer(response.data);
            console.log('Response:', response.data);
        } catch (error) {
            console.error('Error:', error);
            setAnswer('Error: Could not get response from AI');
        } finally {
            setLoading(false);
        }
    };


    return (
        <Box sx={{ display: 'flex', flexDirection: 'column', gap: 2, p: 2 }}>
            <Box sx={{ display: 'flex', gap: 2, alignItems: 'center' }}>
                <TextField
                    fullWidth
                    label="Ask a question"
                    value={question}
                    onChange={(e) => setQuestion(e.target.value)}
                    variant="outlined"
                />
                <Button
                    variant="contained"
                    onClick={handleSubmit}
                    disabled={!question.trim() || loading}
                >
                    {loading ? 'Loading...' : 'Search'}
                </Button>
            </Box>

            {answer && (
                <Paper elevation={3} sx={{ p: 2, mt: 2 }}>
                    <Typography variant="body1" whiteSpace="pre-wrap">
                        {answer}
                    </Typography>
                </Paper>
            )}
        </Box>
    );
};