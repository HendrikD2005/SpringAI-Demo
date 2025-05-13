import {IonApp, IonHeader, IonToolbar, IonTitle, IonContent, IonPage, IonFooter} from '@ionic/react';
import '@ionic/react/css/core.css';

import { setupIonicReact } from '@ionic/react';

setupIonicReact();

const App = () => (
    <IonApp>
        <IonPage>
            <IonHeader>
                <IonToolbar>
                    <IonTitle>SpringAI - Demo with Ollama</IonTitle>
                </IonToolbar>
            </IonHeader>
                <IonContent className="ion-padding">
                    <h1>Chat</h1>
                </IonContent>
            <IonFooter>
                <IonToolbar>
                    <IonTitle>Version: </IonTitle>
                </IonToolbar>
            </IonFooter>
        </IonPage>
    </IonApp>
);

export default App;