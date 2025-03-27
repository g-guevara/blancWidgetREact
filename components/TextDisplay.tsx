import React from 'react';
import { StyleSheet } from 'react-native';
import { ThemedText } from '@/components/ThemedText';
import { ThemedView } from '@/components/ThemedView';
import { useText } from '@/context/TextContext';

export default function TextDisplay() {
  const { text } = useText();

  return (
    <ThemedView style={styles.container}>
      <ThemedText type="subtitle">Retrieved Stored Text:</ThemedText>
      <ThemedView style={styles.textBox}>
        {text ? (
          <ThemedText>{text}</ThemedText>
        ) : (
          <ThemedText style={styles.emptyText}>No saved text yet</ThemedText>
        )}
      </ThemedView>
    </ThemedView>
  );
}

const styles = StyleSheet.create({
  container: {
    marginVertical: 16,
    gap: 8,
  },
  textBox: {
    borderWidth: 1,
    borderColor: '#ccc',
    borderRadius: 8,
    padding: 12,
    minHeight: 80,
  },
  emptyText: {
    fontStyle: 'italic',
    opacity: 0.6,
  },
});