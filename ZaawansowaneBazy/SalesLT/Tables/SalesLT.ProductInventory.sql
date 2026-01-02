CREATE TABLE [SalesLT].[ProductInventory] (
    [ProductID]    INT      NOT NULL,
    [Quantity]     INT      NOT NULL,
    [ModifiedDate] DATETIME DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([ProductID] ASC)
);

