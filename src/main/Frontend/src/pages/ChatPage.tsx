import { Box } from "@mui/material";
import {QuestionField} from "../components/QuestionField.tsx";

export default function ChatPage() {
    return (
        <Box
            sx={{
                display: 'flex',
                flexDirection: 'column',
                alignItems: 'center',
                justifyContent: 'center',
                height: 'calc(100vh - 64px)',
                marginTop: '64px',
                width: '100%',
            }}
        >
            <QuestionField />
        </Box>
    );
}