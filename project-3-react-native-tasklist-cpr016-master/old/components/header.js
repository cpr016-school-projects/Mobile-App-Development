import React from 'react';
import { View, FlatList, StyleSheet, Text } from 'react-native';

export default function Header() {
    return (
        <View style={styles.header}>
            <Text style={styles.title}>My Todos</Text>
        </View>
    )
}

const styles = StyleSheet.create({
    header: {
        heihgt: 80,
        paddingTop: 38,
        backgroundColor: 'coral'
    },
    title: {
        textAlign: 'left',
        color: "#fff",
        fontSize: 20,
        fontWeight: 'Bold'

    }
})