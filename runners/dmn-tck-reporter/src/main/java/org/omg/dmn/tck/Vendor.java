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

import java.util.Map;

public class Vendor {
    private String                  name;
    private String                  version;
    private Map<String, TestResult> results;

    public Vendor(String name, String version, Map<String, TestResult> results) {
        this.name = name;
        this.version = version;
        this.results = results;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    public Map<String, TestResult> getResults() {
        return results;
    }

    public void setResults(Map<String, TestResult> results) {
        this.results = results;
    }

    @Override
    public boolean equals(Object o) {
        if ( this == o ) return true;
        if ( !(o instanceof Vendor) ) return false;

        Vendor vendor = (Vendor) o;

        if ( name != null ? !name.equals( vendor.name ) : vendor.name != null ) return false;
        return version != null ? version.equals( vendor.version ) : vendor.version == null;
    }

    @Override
    public int hashCode() {
        int result = name != null ? name.hashCode() : 0;
        result = 31 * result + (version != null ? version.hashCode() : 0);
        return result;
    }
}
