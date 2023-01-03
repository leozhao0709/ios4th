//
//  DatePickerBootcamp.swift
//  SwiftUIPlayGround
//
//  Created by Lei Zhao on 12/16/22.
//

import SwiftUI

struct DatePickerBootcamp: View {
    @State var selectDate = Date()
    
    let endDate = Date()
    var startDate:  Date  {
        return Calendar.current.date(byAdding: Calendar.Component.year, value: -2, to: endDate) ?? Date()
    }

    var dateFormatter: DateFormatter {
        let formmater = DateFormatter()
        // https://nsdateformatter.com/#examples
        formmater.dateFormat = "MM/dd/yyyy HH:mm"
        return formmater
    }
    
    var body: some View {
        VStack {
            Text("Select Data is:")
            Text(dateFormatter.string(from: selectDate))
            
            DatePicker(
              "Date",
              selection: $selectDate,
              in: startDate...endDate,
              displayedComponents: [.date,
                .hourAndMinute
              ]
            )
            .accentColor(.purple)
              .datePickerStyle(
                GraphicalDatePickerStyle()
    //            WheelDatePickerStyle()
    //            CompactDatePickerStyle()
          )
        }
    }
}

struct DatePickerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerBootcamp()
    }
}
