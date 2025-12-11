# 📱task_event_manager

A new Flutter project.

A simple and efficient mobile application to manage daily tasks and events.
The app uses Hive for fast, offline local storage.
All data persists after app restart, fulfilling the project requirement.

🚀Features
✔ Task Management

Add new tasks

Edit tasks

Mark tasks as completed

Long-press to delete a task

Persistent local storage

✔ Event Management

Add events with title, date, time

Edit events

Long-press to delete events

Stored locally with Hive

✔ General Features

Modern, clean UI

Bottom navigation for easy switching

Fast load time

Works completely offline

🧠 State Management

The app uses setState() for state updates.
Reason:

Simple and efficient

Built into Flutter (no external packages required)

Ideal for small to medium apps

Easy to understand and maintain

💾 Local Storage Method
✔ Hive Database

The project uses Hive, a lightweight and extremely fast NoSQL database for Flutter.

Reasons for choosing Hive:

Very fast reads/writes

Stores Dart objects directly using Adapters

Zero boilerplate after setup

Perfect for offline mobile apps

Data persists after the app restarts 🌟

Hive Boxes Used:

tasksBox → stores Task objects

eventsBox → stores EventModel objects


🛠 How to Build & Run the Project

1️⃣ Clone the repository
git clone <https://github.com/salonigoel09/task_event_manager>

2️⃣ Install dependencies
flutter pub get

3️⃣ Generate Hive Adapters
flutter pub run build_runner build --delete-conflicting-outputs

4️⃣ Run the app
flutter run
