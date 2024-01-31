# DoughDough

DoughDough is a simple todo list app that drew inspiration on the idea of "If I can be just 1% better each day, I will be 365% better at the end of the year."

## Description

What makes DoughDough different is that each todo list item has a "time to complete" property associated with it, allowing the user to estimate the amount of time it would take to complete each item.

The status bar at the top of the screen displays the amount of time planned for the day, as well as the percentage of completed items. Items that are not completed today will stay in the list and accumulates "time debt", meaning user will have to allocate extra time to complete the overdue item(s).

The time debt will also display in the status bar to give a visual reminder that procrastinating today will only set us up for failure tomorrow.

<video src="Simulator%20Screen%20Recording%20-%20iPhone%2014%20Pro%20-%202024-01-31%20at%2011.59.05.mp4" controls title="Title"></video>

## Getting Started

Requirements: Xcode 14, Swift 5, and iOS 16

1. Clone project
2. Open project in Xcode
3. Click the "Start an active scheme" button on the upper left corner to run the app in a simulator

As of now, new items can only be added in the backlog then assign it to the Today list. Navigate to the Backlog tab and tap the "+" button at the top right corner. An overlay will display for user to fill in the details.

## Architecture

The project was built using the Model-View-ViewModel (MVVM) design pattern.

**Model**: Holds the necessary data for the app

**View**: Contains all views and subviews to display the data

**ViewModel**: Manages the interactions between models and views to prevent views from directly accessing the data

## Technologies

* Swift 5
* Xcode 14
* XCTest