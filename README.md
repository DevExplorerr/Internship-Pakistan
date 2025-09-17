# Flutter Internship - Week 1, 2, 3, 4, 5 & 6 Tasks  

Welcome to my internship project repository for **Internship Pakistan (Flutter Development - Summer 2025)**.  
This repository contains all the screens and features developed during **Week 1 - Week 6** tasks, focusing on **UI, navigation, state management, Firebase basics, and local storage in Flutter**.  

---

## Screens & Apps Implemented  

### **Week 1 - Basic UI Screens**
- **Splash Screen** - Displays app logo and title.  
- **Profile Screen** - User profile layout with basic details.  
- **Hobbies / Interests List** - Interactive list of user hobbies.  
- **Contact Form** - Form UI for user input (Name, Email, Message, etc.).  

---

### **Week 2 - Daily Expense Tracker (UI Only)**
- **Splash Screen** - App logo, title, and “Internship Pakistan” at the bottom.  
- **Onboarding Screens** - 2–3 slides introducing the app.  
- **Login / Sign-Up Screen** - Email & password fields with navigation links.  
- **Home Screen** - Total Balance card (Income & Expense sections), Recent Expenses list (dummy data), FAB for adding expense.  
- **Add Expense Screen** - Input fields for expense title, amount, date picker (UI only), and Save button.  
- **Expense Details Screen** - Shows title, amount, date, and notes. Includes a back button to Home Screen.  

---

### **Week 3 - Task Management App (with SharedPreferences)**
- **Task List Screen** - Displays list of tasks with search functionality.  
- **Add Task Screen** - Add new tasks with title & description.  
- **Edit Task Screen** - Update existing tasks.  
- **Task Completion Toggle** - Mark tasks as completed/incomplete with a checkbox.  
- **Delete Task** - Remove unwanted tasks.  
- **Persistent Storage** - Tasks saved using SharedPreferences (local storage).  

---

### **Week 4 - Recipe App (Cookify - Your Personal Recipe Book)**
- **Splash Screen** - App logo and title.  
- **Home Screen** - Grid of recipes with image, title, time, and rating.  
- **Recipe Detail Screen** - Full recipe details including:  
  - Recipe image  
  - Title  
  - Ingredients list  
  - Step-by-step cooking instructions  
- **Search Functionality** - Search bar to filter recipes by name and category.  
- **Favorites (Bookmark Feature)** - Save recipes as favorites using **Provider**.  
- **Favorites Screen** - Separate screen to view all saved recipes.  
- **UI/UX Improvements** - Food theme (green + white), clean typography, spacing, responsive layout.  

---

### **Week 5 & 6 - Mini Event Registration App**
- **Home Screen** - List of upcoming events (dummy data) with image, title, date, and short description.  
- **Event Details Screen** - Full details of the selected event (title, description, date, time, location, image). Includes a **Register button**.  
- **Registration System** - When a user registers, the event is saved in local storage (**Hive**).  
- **My Registrations Screen** - Displays all registered events with options to view ticket, bookmark event or unregister.  
- **Search & Filter** - Search events by name/date for easier navigation.  
- **QR Code Generation** - Each registered event generates a **unique QR code** (via `qr_flutter`) for check-in purposes.  
- **Firebase Authentication ** - Login & Signup integration with Firebase.  
- **Favorites (Bookmark Feature)** - Users can bookmark/save events for quick access.  
- **UI/UX** - Clean responsive design, consistent colors, shadows, and rounded corners for premium look.  

---

## Packages Used  

**Week 2**  
- `google_fonts`  
- `intl`  
- `smooth_page_indicator`  

**Week 3**  
- `shared_preferences`  

**Week 4**  
- `provider`  
- `google_fonts`  

**Week 5 & 6**  
- `hive` & `hive_flutter`  
- `qr_flutter`  
- `provider`  
- `firebase_core`  
- `firebase_auth`  

---

**Internship Program**
This work is part of the Flutter Internship Program by Internship Pakistan (Summer 2025).
