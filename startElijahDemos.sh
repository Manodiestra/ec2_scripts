#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Step 1: Check and clone the Django repository
REPO_DJANGO="django-example-fall-2024"
if [ -d "$REPO_DJANGO" ]; then
  echo "Django repository already exists. Skipping clone."
else
  echo "Run the install script first!"
  exit 1
fi
cd $REPO_DJANGO

# Step 2: Activate the virtual environment
echo "Activating Python virtual environment..."
source venv/bin/activate

# Step 3: Run the Django server
echo "Starting Django server on 0.0.0.0:8000..."
python manage.py runserver 0.0.0.0:8000 &

# Step 4: Navigate out of the Django project folder
cd ..

# Step 5: Check and clone the Expo repository
REPO_EXPO="expo-example-fall-2024"
if [ -d "$REPO_EXPO" ]; then
  echo "Expo repository already exists. Skipping clone."
else
  echo "You need to clone the Expo repository first!"
  exit 1
fi
cd $REPO_EXPO

# Step 9: Run the Expo app
echo "Starting Expo app on port 8081..."
npm start &
