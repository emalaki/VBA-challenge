Attribute VB_Name = "Module1"
Sub multiple_year_stock_data()

    For Each ws In Worksheets
    
        Dim WorksheetName As String
        Dim Count_Tickets As Long
        Dim i As Long
        Dim j As Long
        Dim ColumnA_last As Long
        Dim ColumnI_last As Long
        Dim PercentDifference As Double
        Dim Increase As Double
        Dim Decrease As Double
        Dim Volume As Double
        WorksheetName = ws.Name
        ws.Cells(1, 9).Value = "Ticker"
        ws.Cells(1, 10).Value = "Yearly Change"
        ws.Cells(1, 11).Value = "Percent Change"
        ws.Cells(1, 12).Value = "Total Stock Volume"
        ws.Cells(1, 16).Value = "Ticker"
        ws.Cells(1, 17).Value = "Value"
        ws.Cells(2, 15).Value = "Greatest % Increase"
        ws.Cells(3, 15).Value = "Greatest % Decrease"
        ws.Cells(4, 15).Value = "Greatest Total Volume"
        Count_Tickets = 2
        j = 2
        ColumnA_last = ws.Cells(Rows.Count, 1).End(xlUp).Row
            For i = 2 To ColumnA_last
                If ws.Cells(i + 1, 1).Value <> ws.Cells(i, 1).Value Then
                ws.Cells(Count_Tickets, 9).Value = ws.Cells(i, 1).Value
                ws.Cells(Count_Tickets, 10).Value = ws.Cells(i, 6).Value - ws.Cells(j, 3).Value
                    If ws.Cells(Count_Tickets, 10).Value < 0 Then
                    ws.Cells(Count_Tickets, 10).Interior.ColorIndex = 3
                    
                    Else
                    
                    ws.Cells(Count_Tickets, 10).Interior.ColorIndex = 4
                    
                    End If
                    
                    If ws.Cells(j, 3).Value <> 0 Then
                    PercentDifference = ((ws.Cells(i, 6).Value - ws.Cells(j, 3).Value) / ws.Cells(j, 3).Value)
                    ws.Cells(Count_Tickets, 11).Value = Format(PercentDifference, "Percent")
                    
                    Else
                    
                    ws.Cells(Count_Tickets, 11).Value = Format(0, "Percent")
                    
                    End If
                    
                ws.Cells(Count_Tickets, 12).Value = WorksheetFunction.Sum(Range(ws.Cells(j, 7), ws.Cells(i, 7)))
                
                Count_Tickets = Count_Tickets + 1
                
                j = i + 1
                
                End If
            
            Next i
            
        ColumnI_last = ws.Cells(Rows.Count, 9).End(xlUp).Row
        Volume = ws.Cells(2, 12).Value
        Increase = ws.Cells(2, 11).Value
        Decrease = ws.Cells(2, 11).Value
            For i = 2 To ColumnI_last
                If ws.Cells(i, 12).Value > Volume Then
                Volume = ws.Cells(i, 12).Value
                ws.Cells(4, 16).Value = ws.Cells(i, 9).Value
                
                Else
                
                Volume = Volume
                
                End If

                If ws.Cells(i, 11).Value > Increase Then
                Increase = ws.Cells(i, 11).Value
                ws.Cells(2, 16).Value = ws.Cells(i, 9).Value
                
                Else
                
                Increase = Increase
                
                End If

                If ws.Cells(i, 11).Value < Decrease Then
                Decrease = ws.Cells(i, 11).Value
                ws.Cells(3, 16).Value = ws.Cells(i, 9).Value
                
                Else
                
                Decrease = Decrease
                
                End If

            ws.Cells(2, 17).Value = Format(Increase, "Percent")
            ws.Cells(3, 17).Value = Format(Decrease, "Percent")
            ws.Cells(4, 17).Value = Format(Volume, "Scientific")
            Next i
        Worksheets(WorksheetName).Columns("A:Z").AutoFit
            
    Next ws
        
End Sub

