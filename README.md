---
# 📱task_event_manager

A new Flutter project.

A simple, clean, and efficient Flutter mobile application to manage daily tasks and events.
The app uses Hive for fast, offline local storage, ensuring all data persists even after app restarts.

---
🚀 Features
# ✅ Task Management

➕ Add new tasks

✏️ Edit existing tasks

✔️ Mark tasks as completed

🗑️ Long-press to delete a task

💾 Persistent local storage

# 📅 Event Management

➕ Add events with title, date & time

✏️ Edit events

🗑️ Long-press to delete events

💾 Events stored locally using Hive

---

🌟 General Features

🎨 Modern & clean UI

🔀 Bottom navigation for easy switching

⚡ Fast load time

📶 Works completely offline

🔁 Data remains available after app restart

🧠 State Management

The application uses setState() for managing state.

Why setState()?

✔ Simple and efficient

✔ Built-in Flutter solution (no extra packages)

✔ Ideal for small to medium-scale apps

✔ Easy to understand and maintain

---

💾 Local Storage
📦 Hive Database

The project uses Hive, a lightweight and extremely fast NoSQL database for Flutter.

Why Hive?

🚀 Very fast read & write operations

🧩 Stores Dart objects directly using adapters

🛠 Minimal boilerplate after setup

📱 Perfect for offline-first mobile apps

🔐 Data persists across app restarts

🗂 Hive Boxes Used

📌 tasksBox → Stores Task objects

📌 eventsBox → Stores EventModel objects

---

🛠 How to Build & Run the Project
1️⃣ Clone the Repository
```bash
 git clone https://github.com/salonigoel09/task_event_manager
```

2️⃣ Install Dependencies
```bash
flutter pub get
```

3️⃣ Generate Hive Adapters
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

4️⃣ Run the App
```bash
flutter run
```
---

📌 Project Highlights

Fully offline-capable app

Clean architecture and readable code

Efficient local storage using Hive

Meets all assignment requirementsun build_runner build --delete-conflicting-outputs

