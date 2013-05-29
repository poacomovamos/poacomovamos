describe("calendar.for", function () {
  it("works for october 2013", function () {
    var october = calendar.for(10, 2013);
    var rows = october.getRows();
    // expect(rows[0]).toEqual(["", "", 1, 2, 3, 4, 5]);
    // expect(rows[1]).toEqual([6, 7, 8, 9, 10, 11, 12]);
    expect(rows[2]).toEqual([13, 14, 15, 16, 17, 18, 19]);
    // expect(rows[3]).toEqual([20, 21, 22, 23, 24, 25, 26]);
    // expect(rows[4]).toEqual([27, 28, 29, 39, 31, "", ""]);
  });
});
