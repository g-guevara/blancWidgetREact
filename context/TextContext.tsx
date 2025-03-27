import React, { createContext, useState, useContext, useEffect } from 'react';
import AsyncStorage from '@react-native-async-storage/async-storage';

// Define the shape of our context
type TextContextType = {
  text: string;
  setText: (text: string) => void;
  saveText: () => Promise<void>;
};

// Create the context with default values
const TextContext = createContext<TextContextType>({
  text: '',
  setText: () => {},
  saveText: async () => {},
});

// Storage key for AsyncStorage
const STORAGE_KEY = 'user_input_text';

// Provider component to wrap the app
export const TextProvider: React.FC<{ children: React.ReactNode }> = ({ children }) => {
  const [text, setText] = useState('');
  
  // Load saved text when the component mounts
  useEffect(() => {
    const loadSavedText = async () => {
      try {
        const savedText = await AsyncStorage.getItem(STORAGE_KEY);
        if (savedText !== null) {
          setText(savedText);
        }
      } catch (error) {
        console.error('Failed to load saved text:', error);
      }
    };
    
    loadSavedText();
  }, []);
  
  // Function to save text to AsyncStorage
  const saveText = async () => {
    try {
      await AsyncStorage.setItem(STORAGE_KEY, text);
      console.log('Text saved successfully');
    } catch (error) {
      console.error('Failed to save text:', error);
    }
  };
  
  return (
    <TextContext.Provider value={{ text, setText, saveText }}>
      {children}
    </TextContext.Provider>
  );
};

// Custom hook to use the text context
export const useText = () => useContext(TextContext);