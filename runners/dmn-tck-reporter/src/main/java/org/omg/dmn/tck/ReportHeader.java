/*
 * Copyright 2017 Red Hat, Inc. and/or its affiliates.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *       http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.omg.dmn.tck;

public class ReportHeader {
    private String totalTests;
    private String totalLabels;
    private String totalProducts;

    public ReportHeader() {
    }

    public ReportHeader(String totalTests, String totalLabels, String totalProducts) {
        this.totalTests = totalTests;
        this.totalLabels = totalLabels;
        this.totalProducts = totalProducts;
    }

    public String getTotalTests() {
        return totalTests;
    }

    public void setTotalTests(String totalTests) {
        this.totalTests = totalTests;
    }

    public String getTotalLabels() {
        return totalLabels;
    }

    public void setTotalLabels(String totalLabels) {
        this.totalLabels = totalLabels;
    }

    public String getTotalProducts() {
        return totalProducts;
    }

    public void setTotalProducts(String totalProducts) {
        this.totalProducts = totalProducts;
    }
}
