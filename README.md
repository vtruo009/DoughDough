# DoughDough

DoughDough is a simple todo list app that drew inspiration from the idea "If I can be just 1% better each day, I will be 365% better at the end of the year."

## Description

What makes DoughDough different is that each todo list item has a "time to complete" property associated with it, allowing the user to estimate the amount of time it would take to complete each item and how much time they should allocate for the day.

The stats bar right below the "Today" title displays the amount of time planned for the day, as well as the percentage of completed items. Items that are not completed today will stay in the list and accumulate "time debt", meaning user will have to allocate extra time to complete the overdue item(s).

### Screenshots/Demo

<img src="https://github.com/vtruo009/DoughDough/assets/43657607/d56d4f23-abab-4d8d-bdb0-d8f6b0287c30" alt="backlog" style="width:200px;">
<img src="https://github.com/vtruo009/DoughDough/assets/43657607/cc3c0120-2155-42fb-98c4-2ab5f4c04fd5" alt="backlog" style="width:200px;">
<img src="https://github.com/vtruo009/DoughDough/assets/43657607/717f88ba-5bfd-4aeb-ba9f-dd050057c5cd" alt="backlog" style="width:200px;">
<img src="https://github.com/vtruo009/DoughDough/assets/43657607/14a685c2-a99b-405b-b48e-3243e3d81be3" alt="backlog" style="width:200px;">

See [full demo](https://youtube.com/shorts/2Mj1D06SvF4).

## Getting Started

Requirements: Xcode 14, Swift 5, and iOS 16

1. Clone project
2. Open project in Xcode
3. Click the "Start an active scheme" button in the upper left corner to run the app in a simulator
4. Once the simulator is booted up, the Backlog view should be displayed
5. Click the "+" button in the upper right corner of either view to add a new item
6. Click the info icon next to the item to edit the details

## Architecture

The project was built using the Model-View-ViewModel (MVVM) design pattern.

**Model**: Holds the necessary data for the app

**View**: Contains all views and subviews to display the data

**ViewModel**: Manages the interactions between models and views to prevent views from directly accessing the data

## Technologies

* Swift 5
* Xcode 14
* XCTest
* Core Data

## Next Steps

1. **Display date**

   Display the date property in the Item Detail view, reminding user of when the todo item was assigned/planned. As of now, the user should not be able to edit the date by the nature of the app because the goal is to ensure the user carefully selects their top priorities each day.

2. **Add and display day(s) since assigned date**

   This field will update and increment by 1 for everyday that the todo item is pushed to the next day.

3. **Add separate debt area to the stats bar**

   Currently, the time debt is automatically added to the total time as if it was planned today. Add a separate stat to display the time owed today and use color to imply urgency.

## Future Improvements & Advanced Features

More advanced features that I would like to bring to DoughDough:

* Continuing with the visual cue theme, a trend graph displaying the progress the user has been making throughout the year would be helpful. Regular check-ins help user stay on track and/or re-assess their productivity approach if needed.
* Using Core Data, which is the machine's local memory, to save user generated data could become inconvenient and unreliable. Integrating with FireBase or other cloud storage would give user more flexibility.
