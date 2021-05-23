import * as React from 'react';
import { SplashScreen } from 'expo';
import * as Font from 'expo-font';
import { Ionicons } from '@expo/vector-icons';
import TaskContextWrapper from './context/TaskContextWrapper';
import AppNavigator from "./AppNavigator";

export default function App(props) {
      return (
       <TaskContextWrapper>
         <AppNavigator />
       </TaskContextWrapper>
    );
  }