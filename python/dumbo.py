import csv
import datetime
from typing import List, Dict

def parse_schedule_data():
    """Parse the class schedule data and return structured information"""
    
    # Class schedule data
    classes = [
        {
            "name": "Project 1",
            "sessions": [
                {"day": "Monday", "time": "1-3", "room": "302-A5", "start_date": "08/09/2025", "end_date": "21/09/2025"},
                {"day": "Monday", "time": "1-3", "room": "302-A5", "start_date": "11/08/2025", "end_date": "31/08/2025"},
                {"day": "Monday", "time": "1-3", "room": "302-A5", "start_date": "22/09/2025", "end_date": "28/09/2025"}
            ]
        },
        {
            "name": "Khai phá dữ liệu",
            "sessions": [
                {"day": "Friday", "time": "1-3", "room": "401-A7", "start_date": "11/08/2025", "end_date": "26/10/2025"},
                {"day": "Tuesday", "time": "10-12", "room": "405-A8", "start_date": "27/10/2025", "end_date": "16/11/2025"},
                {"day": "Friday", "time": "1-3", "room": "401-A7", "start_date": "27/10/2025", "end_date": "16/11/2025"}
            ]
        },
        {
            "name": "An ninh mạng",
            "sessions": [
                {"day": "Thursday", "time": "10-12", "room": "401-A7", "start_date": "11/08/2025", "end_date": "26/10/2025"},
                {"day": "Tuesday", "time": "1-3", "room": "301-A5", "start_date": "06/10/2025", "end_date": "26/10/2025"},
                {"day": "Thursday", "time": "10-12", "room": "401-A7", "start_date": "27/10/2025", "end_date": "16/11/2025"}
            ]
        },
        {
            "name": "Phát triển phần mềm mã nguồn mở",
            "sessions": [
                {"day": "Friday", "time": "10-12", "room": "401-A7", "start_date": "11/08/2025", "end_date": "26/10/2025"},
                {"day": "Tuesday", "time": "1-3", "room": "401-A7", "start_date": "27/10/2025", "end_date": "16/11/2025"},
                {"day": "Friday", "time": "10-12", "room": "401-A7", "start_date": "27/10/2025", "end_date": "16/11/2025"}
            ]
        },
        {
            "name": "Lập trình mạng",
            "sessions": [
                {"day": "Thursday", "time": "7-9", "room": "202-A5", "start_date": "01/09/2025", "end_date": "05/10/2025"},
                {"day": "Tuesday", "time": "4-6", "room": "105-A5", "start_date": "11/08/2025", "end_date": "31/08/2025"},
                {"day": "Thursday", "time": "7-9", "room": "202-A5", "start_date": "11/08/2025", "end_date": "31/08/2025"},
                {"day": "Thursday", "time": "7-9", "room": "202-A5", "start_date": "06/10/2025", "end_date": "16/11/2025"}
            ]
        }
    ]
    
    return classes

def convert_time_to_hours(time_str):
    """Convert time format like '1-3' to start and end hours"""
    if not time_str or time_str == "":
        return "09:00", "11:00"  # Default time for sessions without specific time
    
    try:
        start, end = time_str.split('-')
        start_period = int(start.strip())
        end_period = int(end.strip())
        
        # Time mapping: 1-3 is 7:00-9:30, 4-6 is 9:30-12:00, 7-9 is 13:00-15:30, 10-12 is 15:30-18:00
        time_blocks = {
            "1-3": ("07:00", "09:30"),
            "4-6": ("09:30", "12:00"), 
            "7-9": ("13:00", "15:30"),
            "10-12": ("15:30", "18:00")
        }
        
        time_range = f"{start_period}-{end_period}"
        start_time, end_time = time_blocks.get(time_range, ("09:00", "11:00"))
        
        return start_time, end_time
    except:
        return "09:00", "11:00"

def get_weekday_number(day_name):
    """Convert day name to weekday number (0=Monday, 6=Sunday)"""
    days = {
        "Monday": 0,
        "Tuesday": 1, 
        "Wednesday": 2,
        "Thursday": 3,
        "Friday": 4,
        "Saturday": 5,
        "Sunday": 6
    }
    return days.get(day_name, 0)

def generate_calendar_events(classes):
    """Generate calendar events for all class sessions"""
    events = []
    
    for class_info in classes:
        for session in class_info["sessions"]:
            # Parse dates
            try:
                start_date = datetime.datetime.strptime(session["start_date"], "%d/%m/%Y").date()
                end_date = datetime.datetime.strptime(session["end_date"], "%d/%m/%Y").date()
            except:
                continue
            
            # Get time information
            start_time, end_time = convert_time_to_hours(session["time"])
            
            # Generate recurring events for each week
            current_date = start_date
            target_weekday = get_weekday_number(session["day"])
            
            # Find the first occurrence of the target weekday
            while current_date.weekday() != target_weekday and current_date <= end_date:
                current_date += datetime.timedelta(days=1)
            
            # Generate weekly events
            while current_date <= end_date:
                event = {
                    "Subject": f"{class_info['name']}",
                    "Start Date": current_date.strftime("%m/%d/%Y"),
                    "Start Time": start_time,
                    "End Date": current_date.strftime("%m/%d/%Y"),
                    "End Time": end_time,
                    "Description": f"Room: {session['room']}",
                    "Location": session["room"]
                }
                events.append(event)
                current_date += datetime.timedelta(weeks=1)
    
    return events

def export_to_csv(events, filename="schedule.csv"):
    """Export events to CSV format for Google Calendar import"""
    
    # Google Calendar CSV headers
    headers = [
        "Subject",
        "Start Date", 
        "Start Time",
        "End Date",
        "End Time",
        "Description",
        "Location"
    ]
    
    with open(filename, 'w', newline='', encoding='utf-8') as csvfile:
        writer = csv.DictWriter(csvfile, fieldnames=headers)
        writer.writeheader()
        writer.writerows(events)
    
    print(f"Calendar exported to {filename}")
    print(f"Total events: {len(events)}")

def main():
    """Main function to generate and export schedule"""
    print("Parsing class schedule...")
    classes = parse_schedule_data()
    
    print("Generating calendar events...")
    events = generate_calendar_events(classes)
    
    print("Exporting to CSV...")
    export_to_csv(events, "class_schedule.csv")
    
    # Display summary
    print("\nSchedule Summary:")
    print("================")
    for event in events[:10]:  # Show first 10 events as sample
        print(f"{event['Start Date']} {event['Start Time']}-{event['End Time']}: {event['Subject']}")
    
    if len(events) > 10:
        print(f"... and {len(events)-10} more events")
    
    print(f"\nTo import into Google Calendar:")
    print("1. Go to Google Calendar")
    print("2. Click Settings (gear icon) > Import & export")
    print("3. Select 'class_schedule.csv' file")
    print("4. Choose the calendar to import to")
    print("5. Click Import")

if __name__ == "__main__":
    main()