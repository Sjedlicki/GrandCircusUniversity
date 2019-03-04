
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 03/04/2019 00:32:07
-- Generated from EDMX file: C:\git\GrandCircus\GrandCircus\UserModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [aspnet-GrandCircus-20190303094708];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Enrolls_Enrolls]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Enrolls] DROP CONSTRAINT [FK_Enrolls_Enrolls];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Courses]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Courses];
GO
IF OBJECT_ID(N'[dbo].[Enrolls]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Enrolls];
GO
IF OBJECT_ID(N'[dbo].[Students]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Students];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Courses'
CREATE TABLE [dbo].[Courses] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [CourseName] nvarchar(max)  NOT NULL,
    [Category] nchar(10)  NOT NULL
);
GO

-- Creating table 'Enrolls'
CREATE TABLE [dbo].[Enrolls] (
    [ID] int  NOT NULL,
    [StudentID] int  NOT NULL,
    [CourseID] int  NOT NULL,
    [EnrollDate] datetime  NULL,
    [Grade] nchar(1)  NULL
);
GO

-- Creating table 'Students'
CREATE TABLE [dbo].[Students] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL,
    [PhoneNumber] nchar(10)  NULL,
    [Address] nvarchar(max)  NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Property] nvarchar(max)  NULL
);
GO

-- Creating table 'StudentToCourse'
CREATE TABLE [dbo].[StudentToCourse] (
    [Students_ID] int  NOT NULL,
    [Courses_ID] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [ID] in table 'Courses'
ALTER TABLE [dbo].[Courses]
ADD CONSTRAINT [PK_Courses]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Enrolls'
ALTER TABLE [dbo].[Enrolls]
ADD CONSTRAINT [PK_Enrolls]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Students'
ALTER TABLE [dbo].[Students]
ADD CONSTRAINT [PK_Students]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [Id] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Students_ID], [Courses_ID] in table 'StudentToCourse'
ALTER TABLE [dbo].[StudentToCourse]
ADD CONSTRAINT [PK_StudentToCourse]
    PRIMARY KEY CLUSTERED ([Students_ID], [Courses_ID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Students_ID] in table 'StudentToCourse'
ALTER TABLE [dbo].[StudentToCourse]
ADD CONSTRAINT [FK_StudentToCourse_Student]
    FOREIGN KEY ([Students_ID])
    REFERENCES [dbo].[Students]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Courses_ID] in table 'StudentToCourse'
ALTER TABLE [dbo].[StudentToCourse]
ADD CONSTRAINT [FK_StudentToCourse_Course]
    FOREIGN KEY ([Courses_ID])
    REFERENCES [dbo].[Courses]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_StudentToCourse_Course'
CREATE INDEX [IX_FK_StudentToCourse_Course]
ON [dbo].[StudentToCourse]
    ([Courses_ID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------