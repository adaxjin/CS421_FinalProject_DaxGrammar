using Antlr4.Runtime;
using Microsoft.VisualStudio.TestTools.UnitTesting;
namespace AntlrCSharpTests;

[TestClass]
public class DAXGrammarTests
{
    [TestMethod]
    public void TestAggregationFunctions_COUNT()
    {
        var parser = CreateParser("COUNT(TableName)");
        var context = parser.startRule();
        Assert.AreEqual(0, parser.NumberOfSyntaxErrors);
        Assert.IsNotNull(context);
    }

    [TestMethod]
    public void TestAggregationFunctions_COUNTROWS()
    {
        var parser = CreateParser("COUNTROWS(TableName)");
        var context = parser.startRule();
        Assert.AreEqual(0, parser.NumberOfSyntaxErrors);
        Assert.IsNotNull(context);

        parser = CreateParser("COUNTROWS()");
        context = parser.startRule();
        Assert.AreEqual(0, parser.NumberOfSyntaxErrors);
        Assert.IsNotNull(context);
    }

    [TestMethod]
    public void TestAggregationFunctions_MAXX()
    {
        var parser = CreateParser("MAXX(table1, expressionA, true)");
        var context = parser.startRule();
        Assert.AreEqual(0, parser.NumberOfSyntaxErrors);
        Assert.IsNotNull(context);
    }

    [TestMethod]
    public void TestInformationFunctions_CONTAINSROW()
    {
        var parser = CreateParser("CONTAINSROW(table, A)");
        var context = parser.startRule();
        Assert.AreEqual(0, parser.NumberOfSyntaxErrors);
        Assert.IsNotNull(context);

        parser = CreateParser("CONTAINSROW(table, A, B, C1)");
        context = parser.startRule();
        Assert.AreEqual(0, parser.NumberOfSyntaxErrors);
        Assert.IsNotNull(context);
    }

    [TestMethod]
    public void TestInformationFunctions_ISAFTER()
    {
        var parser = CreateParser("isafter(colRef, 1)");
        var context = parser.startRule();
        Assert.AreEqual(0, parser.NumberOfSyntaxErrors);
        Assert.IsNotNull(context);

        parser = CreateParser("ISAFTER(colRef, 1, DEC)");
        context = parser.startRule();
        Assert.AreEqual(0, parser.NumberOfSyntaxErrors);
        Assert.IsNotNull(context);

        parser = CreateParser("ISAFTER(colRef, 1, 2, 3, DEC)");
        context = parser.startRule();
        Assert.AreEqual(0, parser.NumberOfSyntaxErrors);
        Assert.IsNotNull(context);
        
        parser = CreateParser("ISAFTER(colRef, 1, DEC, colRef2, 2, ASC)");
        context = parser.startRule();
        Assert.AreEqual(0, parser.NumberOfSyntaxErrors);
        Assert.IsNotNull(context);
    }

    [TestMethod]
    public void TestInformationFunctions_ISSELECTEDMEASURE()
    {
        var parser = CreateParser("ISSELECTEDMEASURE(Measure1)");
        var context = parser.startRule();
        Assert.AreEqual(0, parser.NumberOfSyntaxErrors);
        Assert.IsNotNull(context);

        parser = CreateParser("ISSELECTEDMEASURE(Measure1,Measure2,Measure3,Measure4)");
        context = parser.startRule();
        Assert.AreEqual(0, parser.NumberOfSyntaxErrors);
        Assert.IsNotNull(context);
    }

    private DAXGrammarParser CreateParser(string input)
    {
        var inputStream = new AntlrInputStream(input);
        var lexer = new DAXGrammarLexer(inputStream);
        var commonTokenStream = new CommonTokenStream(lexer);
        return new DAXGrammarParser(commonTokenStream);
    }
}